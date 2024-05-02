# Define vectors to be used later ---------------------------------------------
# store the vectors in a list to keep the global environment clean
vectors <- list()

vectors$data_file_path <- c(
        "empirical",
        "data",
        "zaklan_replication"
)

vectors$nace_to_keep <- c(
        "35.00",
        "35.10",
        "35.11",
        "35.13",
        "35.14",
        "35.20",
        "35.21",
        "35.22",
        "35.23",
        "35.30"
)

vectors$countries_free_alloc <- c(
        "BG",
        "CY",
        "CZ",
        "EE",
        "HU",
        "LT",
        "PL",
        "RO"
)

vectors$subsamples <- c(
        "coal",
        "coal_one_inst_firm",
        "coal_multi_inst",
        "gas",
        "gas_one_inst_firm",
        "gas_multi_inst"
)

# sort vectors list alphabetically
vectors <- vectors[order(names(vectors))]


# Define custom functions -----------------------------------------------------
# created to make the code more concise
here_vector <- function(path_vec) {
        do.call(
                here,
                as.list(path_vec)
        )
}

# create a function that calculates propensity scores for subsamples
calc_ps <- function(data, subsample) {
        data_set <- data %>%
                filter(.data[[subsample]] == 1)

        ps_diff <- glue("ps_diff_{subsample}")
        matched_control <- glue("matched_control_{subsample}")
        pscore_treated <- glue("pscore_r_{subsample}_1")
        pscore_control <- glue("pscore_r_{subsample}_0")

        ps <- matchit(
                formula = treated ~ avg_ln_emissions_2009_2012,
                data = data_set,
                method = "nearest",
                discard = "both",
                replace = TRUE,
                verbose = TRUE
        )

        matched_data <- match.data(
                ps,
                data = data_set,
                distance = glue("pscore_r_{subsample}"),
                weights = glue("weight_{subsample}"),
                drop.unmatched = FALSE
        ) %>%
                as_tibble()

        get_matches_data <- get_matches(
                ps,
                data = data_set,
                distance = glue("pscore_r_{subsample}")
        ) %>%
                as_tibble() %>%
                select(all_of(c(
                        "subclass",
                        "inst_num",
                        "treated",
                        glue("pscore_r_{subsample}")
                ))) %>%
                pivot_wider(
                        names_from = treated,
                        values_from = all_of(c(
                                "inst_num",
                                glue("pscore_r_{subsample}")
                        ))
                ) %>%
                mutate(
                        {{ ps_diff }} := get(pscore_treated) -
                                get(pscore_control),
                        .keep = "unused"
                ) %>%
                rename(
                        {{ matched_control }} := inst_num_0
                ) %>%
                select(-subclass)

        matched_data <- matched_data %>%
                left_join(
                        get_matches_data,
                        by = c("inst_num" = "inst_num_1")
                )
}