# Empirical Track

## What you can expect from this part of the course

In this part of the course, we will replicate and extend environmental economics papers. These papers employ various empirical methodologies, aiming to identify a causal effect. We will work with the statistical programming language `R`. The following sections provide exercises that introduce you to carrying out empirical research yourselves and getting up to speed with `R`. Moreover, you will find a list of useful resources [below](#useful-resources-for-working-with-r).

What we are mainly doing in this track of the course, namely working with observational data and trying to identify causal relationships, represents a major subfield of environmental economics. Nevertheless, even the empirical side of environmental economics is much more diverse than what is represented by the selection of papers that we will have a look at. For a nice overview of research trends, feel free to check out [this article](https://doi.org/10.1016/j.jeem.2018.08.001). Consider this part of the course as a hopefully enlightening sneak peek into *one of several* areas of (empirical) environmental economics.

By working with observational data sets and extending the methodology employed in published academic papers, this track aims to improve your technical `R` skills as well as deepen your understanding of the strengths and limitations of empirical approaches in environmental economics.

---

## Homework (assigned April 21st, due May 2nd)

Conducting empirical research is an exciting and rewarding endeavour: You are working with valuable information collected in the real world, aggregated into comprehensive and tidy datasets that allow you to get a scientific answer to every question that comes to your mind. You think that sounds a bit too simple and too good to be true? Unfortunately, you are right about that. It is a bit more complicated. In the following two exercises, you will get a flavour of what it is like to carry out empirical research using observational data, highlighting both the appeal of causal identification as well as practical challenges.

### Exercise 1: Finding a research question, data, and methodology

Most research projects begin with a research question and/or a useful data set. Coming up with a research question that a) you find interesting, b) you can provide an answer to by employing a convincing empirical approach, c) for which you have the necessary data, and d) that ideally contributes to the research frontier is a formidable challenge.

As some of you will at some point face this exciting challenge for your master's thesis, you now have the opportunity to design a research project that you find interesting. You will not need to follow up on this project, but you might want to consider it as preparation for a master's thesis.

#### Tasks

You will not have to submit your answers. However, you will discuss your thoughts with your neighbour on May 2.

1. Come up with a **research question** that you find interesting that involves identifying a causal effect.

- Be precise in formulating what you want to analyse (e.g., what is the effect of policy x on outcome y).
- Do not overthink whether it is possible to answer the question for now. Follow your interests, gaps in the academic literature, or open questions you heard in policy debates.

2. Argue **why your research question is important** and deserves attention.

- Go beyond stating that you are personally interested.
- Is it relevant to the policy debate in country X? Is there a knowledge gap in the academic literature? Are you testing specific economic theories in real empirical settings? Is it important in terms of efficiency/distributional justice/...?

3. Come up with an **empirical approach** suitable for your context.

- Could be difference-in-difference, instrumental variables, randomised control trial, ...
- Be explicit about what assumptions need to be satisfied in order to identify a causal effect.
- Are these assumptions likely to hold in the setting you consider?

4. Spend some time searching for **data sets** that you would need to carry out the analysis.

- What kind of variables do you need data on?
- If you do not find data sets, be explicit about what kind of data you would need
  - e.g., what spatial and temporal resolution: Do you need emissions data at the sectoral level? At the level of industrial facilities? Yearly, daily, ...?

### Exercise 2: Data preparation

When working on empirical projects, you will likely spend a substantial share of your time on merging data sets, cleaning, and rearranging them to suit your needs. To familiarise yourselves with this process, the second exercise involves preparing parts of the data of a paper that we will have a closer look at on May 2.

For the data handling, we will mostly use the excellent packages from the `tidyverse` (see [here](https://www.tidyverse.org/packages/)), particularly `dplyr` and `tidyr`. Before jumping into the exercise, feel free to check out the helpful R resources listed [below](#useful-resources-for-working-with-r).

The replication exercise is based on the [repository by Aleksandar Zaklan](https://doi.org/10.3886/E152861V1), which is written in `Stata`. Therefore, if you are familiar with `Stata` and new to `R`, you might check out the file `Create_estimation_datasets.do` in the repository. Please note though that you are not encouraged to translate code from `Stata` to `R` line-by-line. Rather, think about what the code achieves and how to best implement it. For most tasks, it is possible to find a more concise and elegant solution in `R`.

#### Setting up the working environment

Before starting the tasks ahead, you should have already saved the repository locally on your computer, installed `R`, `Visual Studio Code` (VSC), and the `R` extension in VSC following the instructions from the [README in the parent folder](../README.md#software-requirements).

Let's make sure to open the repository correctly. This step is crucial to make sure that the relative paths used in the coding scripts work. There are two easy ways of doing so. First, if you are using Github Desktop, you can choose the repository on the top left and then click `Repository -> Open in Visual Studio Code` on the top bar. The second approach is to simply open VSC, press `Ctrl+K Ctrl+O` (Windows/Linux) or `⌘K ⌘O` (Mac) to open a folder, and choose the repository locally saved on your computer.

Having set the repository as the current working environment in VSC, now open the file located under [./src/zaklan_replication.r](./src/zaklan_replication.r) and copy its contents. Create an empty R file: In VSC, press `Ctrl+Shift+P` (Windows/Linux) or `⇧⌘P` (Mac) and type in `create new file`, press `Enter` and choose `R Document (r)` from the list. Then, save it with a name of your choice in the folder [./src/](./src/). Paste in the contents of the file [./src/zaklan_replication.r](./src/zaklan_replication.r). You will work in the file you just created for the following tasks, while I will later upload the solutions to [./src/zaklan_replication.r](./src/zaklan_replication.r).

Start a fresh R process by typing `Ctrl+Shift+P` (or `⇧⌘P`) and type `create R terminal`.

Make sure you have installed the necessary packages by running the following code.

``` r
# Install all necessary packages
install.packages(c(
        # contains various packages essential for data science in R
        "tidyverse",
        # handles relative paths; facilitating replicability
        "here",
        # used for propensity score matching (PSM)
        "MatchIt"
))
```

Ready? Let's start coding.

#### Preparing the data

Please note that the exercise is rather extensive. Do not feel pressured to complete all tasks. Rather, ask yourself what you can take from this exercise and improve your skills. If you are new to `R` and coding in general, even completing some of the first steps will be a good achievement. If you are more advanced, the exercise should not be too challenging, but it will still be a good opportunity to refresh your skills.

After each task, I provide the data set in the form of how it should look after the task. If you are stuck with a specific task, you can load the data from the checkpoint and continue with the next task.

If you are fully comfortable with cleaning the data, which is the main focus of most of the tasks, you can also jump ahead to [the last task](#task-add-propensity-scores-to-the-data) (open coding instructions below for the link to work) which involves propensity score matching. Simply load the data from the checkpoint before. In general, should you want to skip a task, you can load the data from the checkpoint and continue with the next task.

<details>
<summary> Click here to open the coding instructions. </summary>

##### Task: Loading the packages

You should now have opened the file you created in the [previous step](#setting-up-the-working-environment) and have inserted the code that was provided in [./src/zaklan_replication.r](./src/zaklan_replication.r).

Load the packages and set the reference point for relative paths by running the code from `library(tidyverse)` to `here()`. The last piece of output in the R terminal should now display the path of the repository:

``` r
> here()
[1] "C:/.../adv_env_econ_24"
```

##### Task: Loading and cleaning the EUTL data

- Import the six data sets stored under [./data/zaklan_replication](./data/zaklan_replication/). Name them after the file names without the `.csv` extension, e.g., `electricity_market_data`.
- Create a data set called `data_inst` based on the data set `eutl_oha_data`.
- Keep only the years (column `year`) between and including 2009 and 2017.
- Keep the following columns (drop the rest):

``` r
c(
        "installationidentifier",
        "account_holder",
        "registry_code",
        "installation_name",
        "year",
        "allocated",
        "verified_emiss"
)
```

- Transform `verified_emiss` to a numeric variable (keeping the name). If `verified_emiss` is one of `c("Excluded", "Not Reported")`, set it to `NA`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/clean_eutl.csv](./data/zaklan_replication/checkpoints/clean_eutl.csv)

</details>

##### Task: Add NACE codes

- Add the data set `nace` to `data_inst`, preserving all observations (rows) in `data_inst`. Use the following variables as identifiers: `c("registry_code", "installationidentifier")`.
- Keep only observations where `nacerev2` is one of:

``` r
c(
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
```

- Remove observations where the country (`registry_code`) is `"GB"`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/nace.csv](./data/zaklan_replication/checkpoints/nace.csv)

</details>

##### Task: Further cleaning and create treatment variables

- Replace `NA` values in the columns `c(verified_emiss, allocated)` with `0`.
- For `verified_emiss`, set values smaller than `10` to `0`.
- Group the data by `installationidentifier` and `registry_code` and remove the groups, in which at least one value of `verified_emiss` is `NA` or `0`. Ungroup the data.
- Create a new variable `ln_emissions` that is the natural logarithm of `verified_emiss`.
- Sort the data by `installationidentifier` and `registry_code`.
- Create one installation and one firm identifier. `inst_num` should be unique for each combination of `c("installationidentifier", "registry_code")`, while `firm_num` should be unique for each `account_holder`.
- Create the variable `treated` that should equal `1` if the country (as defined by `registry_code`) is not part of the vector below and `0` otherwise:

``` r
c(
        "BG",
        "CY",
        "CZ",
        "EE",
        "HU",
        "LT",
        "PL",
        "RO"
)
```

- Create a variable `post` that equals `1` if the year is between and including `2013` and `2017` and `0` otherwise. Create `post_treated` as the interaction of `post` and `treated`.
- Create the variables `post_2009`, `post_[...]` through `post_2017`. They should equal `1` if `year` is equal to the respective year indicated in the column name and `0` otherwise. For instance, `post_2013` should equal `1` if `year` is equal to `2013` and `0` otherwise.
- Finally, create the variables `post_2009_treated`, `post_[...]_treated` through `post_2017_treated` as the interactions of the respective `post_[...]` and `treated`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/treat_vars.csv](./data/zaklan_replication/checkpoints/treat_vars.csv)

</details>

##### Task: Fuel type information

- Add the column `c("fuel_type")` of the data set `fuel_type_info` to `data_inst`, preserving all observations (rows) in `data_inst`. Use the following variables as identifiers: `c("installationidentifier", "registry_code")`.
- Keep only observations where `fuel_type` is one of: `c("coal", "gas")`.
- Create two new variables `coal` and `gas` that should equal `1` if `fuel_type` is equal to the respective fuel type and `0` otherwise.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/fuel_type.csv](./data/zaklan_replication/checkpoints/fuel_type.csv)

</details>

##### Task: Add identifiers for multi/single installation firms

- Create a new variable `inst_count` that counts the number of unique `installationidentifier` for each `firm_num`.
- Create a variable `one_inst_firm` that equals `1` if `inst_count` is equal to `1` and `0` otherwise. Drop `inst_count`.
- Create the variables `coal_one_inst_firm` and `gas_one_inst_firm` as the interactions of `coal` and `gas`, respectively, with `one_inst_firm`.
- Create the variables `coal_multi_inst` and `gas_multi_inst` in an analogous manner.
- Sort the data by `registry_code`, `installationidentifier`, and `year`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/multi_single.csv](./data/zaklan_replication/checkpoints/multi_single.csv)

</details>

##### Task: Add data on electricity, GDP etc

- Add the variables `c("final_electricity_consumption", "RE", "GDP", "exports", "imports")` from the data set `electricity_market_data` to `data_inst`, preserving all observations (rows) in `data_inst`. Use the variables `c("registry_code", "year")` as identifiers.
- Create the variable `net_exports` as the difference between `exports` and `imports`, divided by `1000`; drop `exports` and `imports`.
- Merge the data set `fuel_eua_p` to `data_inst`, matching by `year`.
- Create the variables `ln_final_electricity_consumption`, `ln_RE`, and `ln_GDP` as the natural logarithms of the respective variables.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/electricity.csv](./data/zaklan_replication/checkpoints/electricity.csv)

</details>

##### Task: Add EUTL transaction data

- Add the variables `c("net_ac_ext_inst", "net_ac_tot_inst", "annual_change_bank_inst", "bank_inst")` from the data set `trading_banking_data` to `data_inst`, preserving all observations (rows) in `data_inst`. Use the variables `c("registry_code", "installationidentifier", "year")` as identifiers.
- Create the variables `annual_change_bank_inst_1000` and `net_ac_ext_inst_1000` as the respective variables divided by `1000`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/transactions.csv](./data/zaklan_replication/checkpoints/transactions.csv)

</details>

##### Task: Prepare the data for propensity score matching

- Create a data set called `data_inst_psm` based on the data set `data_inst`.
- Keep the following variables and drop the rest:

``` r
c(
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
)
```

- Reshape the data set to wide format, using `ln_emissions` as the variable to be spread and `year` as the variable to be spread by. The names of the new columns should be `ln_emissions2009`, ..., `ln_emissions2017`.
- Create a new variable `avg_ln_emissions_2009_2012` that is the average of `ln_emissions2009`, ..., `ln_emissions2012`.
- Sort the data by `inst_num`.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/psm_prep.csv](./data/zaklan_replication/checkpoints/psm_prep.csv)

</details>

##### Task: Add propensity scores to the data

- Use the package `MatchIt` to calculate propensity scores for six subsamples of `data_inst_psm` (data split by fuel type and number of installations) following the instructions below. Familiarise yourself with the functions on the [package website](https://kosukeimai.github.io/MatchIt/).
- Calculate propensity scores six times, once for each subsample. The subsamples are defined by the variables `c("coal", "coal_one_inst_firm", "coal_multi_inst", "gas", "gas_one_inst_firm", "gas_multi_inst")`. The coal subsample should contain all observations where `coal` equals `1` and so on.
- The calculation of the propensity scores should be nearest neighbour matching with replacement, discarding units from both the treated and control group if there is no common support. The matching should be based on a logit model that regresses `treated` on `avg_ln_emissions_2009_2012`.
- For each subsample, four variables should be added to the data set `data_inst_psm`:
  - `pscore_r_[subsample]`: For both treated and control units, this should contain the propensity score.
  - `matched_control_[subsample]`: For treated units, this column should indicate the `inst_num` of the matched control unit. `NA` for control units.
  - `ps_diff_[subsample]`: For treated units, this should contain the difference between the propensity score of the treated unit and the matched control unit. `NA` for control units.
  - `weight_[subsample]`: For each treated and control unit, this should be the weight as calculated by the `MatchIt` package.

<details>
<summary> If you cannot solve this task or prefer to skip it: Click here to access the data checkpoint. </summary>

The data set after this task should look like this: [./data/zaklan_replication/checkpoints/psm.csv](./data/zaklan_replication/checkpoints/psm.csv)

</details>

</details>

---

## Useful resources for working with R

To install `R` and integrate it into `Visual Studio Code`, check out the [README file](../README.md#software-requirements) of the parent folder. The table below lists resources that you will likely find useful when working with R, including for the [exercise above](#exercise-2-data-preparation). The table below lists functions that you might want to use in your code.

<details>
<summary> Click here to open the table. </summary>

| Resource | What is it useful for? |
| --- | --- |
| Free book on [R programming by Roger D. Peng](https://leanpub.com/rprogramming) | Good reference if you are not proficient in R yet. Focus on general R programming (not specifically data analysis), but highly useful nonetheless. If you are new to R, start here. |
| Official references for the most important [tidyverse packages](https://www.tidyverse.org/packages/) for preparing the data: [dplyr](https://dplyr.tidyverse.org/reference/index.html) and [tidyr](https://tidyr.tidyverse.org/) | When working through the [data preparation exercise](#exercise-2-data-preparation), you should check out these two pages to look up specific functions. |
| Free books by [Hadley Wickham](https://hadley.nz/)  | Hadley Wickham is one of the people behind the great [tidyverse](https://www.tidyverse.org/) universe of packages. His books are generally a good reference. |
| Free book on working with the Tidyverse by [Wright et al.](https://leanpub.com/tidyverseskillsdatascience) | The tidyverse is the workhorse for data analysis on R. The book is a comprehensive reference. |
| Lists of packages that could be useful for [econometrics](https://cran.r-project.org/web/views/Econometrics.html) and [causal inference](https://cran.r-project.org/web/views/CausalInference.html) | If you know what you want to implement, but you do not know which R packages enable you to do that, this is a good starting point. |
| [Microsoft Copilot](https://copilot.microsoft.com/) | The creative mode supposedly runs on GPT 4.0, which you do not have access to when using the free version of ChatGPT. Microsoft Copilot is great at answering your questions about R coding. Should you be seriously stuck with the exercise, give it a try. |
| [GitHub Copilot](https://github.com/features/copilot), free for students (available [here](https://education.github.com/discount_requests/application)) | A potent tool that autocompletes and explains code to you; available as a VSC extension. This is not the right tool for you if you are new to R as the suggestions are often inefficient or just wrong. At some point, however, I encourage you to check it out and find out whether it is of any use to you. |

</details>

<details>
<summary> Click here to see functions you might want to use in your code. </summary>

| Package | Functions |
| --- | --- |
| `here`|`here()`|
| `readr` | `read_csv()` |
| `dplyr` | `filter()`, `select()`, `mutate()`, `if_else()`, `case_when()`, `left_join()`, `group_by()`, `ungroup()`, `arrange()`, `rename()`, `pivot_wider()`, `across()`, `starts_with()`, `contains()`, `matches()`, `n_distinct()`, `cur_group_id()` |
| `MatchIt` | `matchit()`, `match.data()`, `get_matches()` |

</details>

---

## Questions and contact

Feel free to contact [Jonas Grunau](mailto:jonas.sebastian.grunau@uni-hamburg.de) if you have clarification questions or are stuck with your coding. However, I also encourage you to spend some time trying to find a solution to any coding problems yourself as this is a core competency when it comes to coding. A bit of frustration is part of the coding experience, but hopefully, this will be compensated by the feeling of accomplishment when you get it running. If you are new to `R` or programming in general, you will likely have many questions initially, but I assure you that the learning curve is very steep and you will improve quickly.
