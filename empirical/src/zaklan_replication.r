# Load packages ---------------------------------------------------------------
library(tidyverse)
library(magrittr)
library(glue)
library(here)
library(MatchIt)


# Set reference point for relative paths --------------------------------------
here()


# Include auxiliary file that defines functions and vectors --------------------
source(here(
        "empirical",
        "src",
        "zaklan_replication_aux.R"
))


# Import data sets ------------------------------------------------------------
paths <- list.files(
        here_vector(vectors$data_file_path),
        pattern = "[.]csv$",
        full.names = TRUE
) %>%
        set_names(str_remove(basename(.), ".csv") %>% str_to_lower)

# Note: Alternatively, you could use here::here() instead of here_vector(), but you'd need to repeat the elements of `vectors$data_file_path` for all data sets. # nolint

data_files <- paths %>%
        map(read_csv)


# Clean EUTL data -------------------------------------------------------------
data_inst <- data_files[["eutl_oha_data"]] %>%
        filter(year >= 2009 & year <= 2017) %>%
        select(c(
                "installationidentifier",
                "account_holder",
                "registry_code",
                "installation_name",
                "year",
                "allocated",
                "verified_emiss"
        )) %>%
        mutate(verified_emiss = if_else(
                verified_emiss %in% c("Excluded", "Not Reported"),
                NA,
                as.numeric(verified_emiss)
        ))


# Add NACE codes to the data set ----------------------------------------------
data_inst <- data_inst %>%
        left_join(
                data_files[["nace"]],
                by = c("registry_code", "installationidentifier")
        ) %>%
        filter(
                nacerev2 %in% vectors$nace_to_keep,
                !registry_code %in% c("GB")
        )


# Clean data and create treatment variables etc. ------------------------------
data_inst <- data_inst %>%
        mutate(across(
                c(verified_emiss, allocated),
                ~ if_else(is.na(.x), 0, .x)
        )) %>%
        mutate(verified_emiss = if_else(
                verified_emiss < 10,
                0,
                verified_emiss
        )) %>%
        group_by(installationidentifier, registry_code) %>%
        filter(
                !any(is.na(verified_emiss) | verified_emiss == 0)
        ) %>%
        ungroup() %>%
        mutate(ln_emissions = log(verified_emiss)) %>%
        arrange(installationidentifier, registry_code) %>%
        mutate(
                inst_num = cur_group_id(),
                .by = c("installationidentifier", "registry_code")
        ) %>%
        mutate(
                firm_num = cur_group_id(),
                .by = c("account_holder")
        ) %>%
        mutate(
                treated = case_when(
                        !registry_code %in% vectors$countries_free_alloc ~ 1,
                        .default = 0
                ),
                year_aux = year
        ) %>%
        pivot_wider(
                names_from = year_aux,
                names_prefix = "post_",
                values_from = year_aux
        ) %>%
        mutate(
                post = if_else(
                        year %in% 2013:2017,
                        1,
                        0
                ),
                across(
                        .cols = starts_with("post_"),
                        ~ case_when(
                                is.na(.x) ~ 0,
                                .default = 1
                        )
                ),
                post_treated = post * treated
        ) %>%
        mutate(
                across(
                        .cols = matches("post_[[:digit:]]"),
                        .fns = ~ .x * treated,
                        .names = "{.col}_treated"
                )
        )


# Add fuel type information to the data set -----------------------------------
data_inst <- data_inst %>%
        left_join(
                data_files[["fuel_type_info"]] %>% select(c(
                        "installationidentifier",
                        "registry_code",
                        "fuel_type"
                )),
                by = c("installationidentifier", "registry_code")
        ) %>%
        filter(
                fuel_type %in% c("coal", "gas")
        ) %>%
        mutate(
                fuel_type_aux = fuel_type
        ) %>%
        pivot_wider(
                names_from = fuel_type_aux,
                values_from = fuel_type_aux
        ) %>%
        mutate(
                across(
                        .cols = c("coal", "gas"),
                        ~ if_else(is.na(.x), 0, 1)
                )
        )


# Add identifiers for multi/single installation firms -------------------------
data_inst <- data_inst %>%
        mutate(
                inst_count = n_distinct(installationidentifier),
                .by = c("firm_num")
        ) %>%
        mutate(
                one_inst_firm = if_else(inst_count == 1, 1, 0),
                .keep = "unused"
        ) %>%
        mutate(
                across(
                        .cols = c("coal", "gas"),
                        .fns = ~ .x * one_inst_firm,
                        .names = "{.col}_one_inst_firm"
                ),
                across(
                        .cols = c("coal", "gas"),
                        .fns = ~ .x * (1 - one_inst_firm),
                        .names = "{.col}_multi_inst"
                )
        ) %>%
        arrange(registry_code, installationidentifier, year)


# Add data on electricity, GDP etc. to the data set ---------------------------
data_inst <- data_inst %>%
        left_join(
                data_files[["electricity_market_data"]] %>% select(c(
                        "registry_code",
                        "year",
                        "final_electricity_consumption",
                        "RE",
                        "GDP",
                        "exports",
                        "imports"
                )),
                by = c("registry_code", "year")
        ) %>%
        mutate(
                net_exports = (exports - imports) / 1e3,
                .keep = "unused"
        ) %>%
        left_join(
                data_files[["fuel_eua_p"]],
                by = c("year")
        ) %>%
        mutate(
                across(
                        .cols = c("final_electricity_consumption", "RE", "GDP"),
                        .fns = ~ log(.x),
                        .names = "ln_{.col}"
                )
        )


# Add EUTL transactions data --------------------------------------------------
data_inst <- data_inst %>%
        left_join(
                data_files[["trading_banking_data"]] %>% select(c(
                        "registry_code",
                        "installationidentifier",
                        "year",
                        "net_ac_ext_inst",
                        "net_ac_tot_inst",
                        "annual_change_bank_inst",
                        "bank_inst"
                )),
                by = c("registry_code", "installationidentifier", "year")
        ) %>%
        mutate(
                across(
                        .cols = c(
                                "annual_change_bank_inst",
                                "net_ac_ext_inst",
                        ),
                        .fns = ~ .x / 1e3,
                        .names = "{.col}_1000"
                )
        )


# Pivot data used to calculate propensity scores ------------------------------
data_inst_psm <- data_inst %>%
        select(c(
                "inst_num",
                "year",
                "ln_emissions",
                "treated",
                "coal",
                "coal_one_inst_firm",
                "coal_multi_inst",
                "gas",
                "gas_one_inst_firm",
                "gas_multi_inst"
        )) %>%
        pivot_wider(
                names_from = year,
                names_prefix = "ln_emissions",
                values_from = c(
                        "ln_emissions"
                )
        ) %>%
        select(
                inst_num,
                everything(),
                contains("emissions")

        ) %>%
        mutate(
                avg_ln_emissions_2009_2012 = rowMeans(
                        pick(ln_emissions2009:ln_emissions2012)
                )
        ) %>%
        arrange(inst_num)


# Add propensity scores to the data set ---------------------------------------
data_inst_psm <- map(
        vectors$subsamples,
        ~ calc_ps(
                data = data_inst_psm,
                subsample = .x
        )
) %>%
        reduce(full_join)