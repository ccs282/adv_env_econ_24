# Empirical Track

## What you can expect from this part of the course

In this part of the course, we will replicate and extend environmental economics papers. These papers employ various empirical methodologies, aiming to identify a causal effect. We will work with the statistical programming language `R`. The following sections provide exercises that introduce you to carrying out empirical research yourselves and getting up to speed with `R`. Moreover, you will find a list of useful resources [below](#useful-resources-for-working-with-r).

What we are mainly doing in this track of the course, namely working with observational data and trying to identify causal relationships, represents a major subfield of environmental economics. Nevertheless, even the empirical side of environmental economics is much more diverse than what is represented by the selection of papers that we will have a look at. For a nice overview of research trends, feel free to check out [this article](https://doi.org/10.1016/j.jeem.2018.08.001). Consider this part of the course as a hopefully enlightening sneak peek into *one of several* areas of (empirical) environmental economics.

By working with observational data sets and extending the methodology employed in published academic papers, this track aims to improve your technical `R` skills as well as deepen your understanding of the strengths and limitations of empirical approaches in environmental economics.

---

## Homework (assigned April 18th, due May 2nd)

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

*The second task of the homework assignments will be made available over the weekend.*

#### Step-by-step instructions

##### Setting up the working environment

##### Preparing the data

---

## Useful resources for working with R

To install `R` and integrate it into `Visual Studio Code`, check out the [README file](../README.md) of the parent folder. The table below lists resources that you will likely find useful when working with R, including for the [exercise above](#exercise-2-data-preparation).

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

---

## Questions and contact

Feel free to contact [Jonas Grunau](mailto:jonas.sebastian.grunau@uni-hamburg.de) if you have clarification questions or are stuck with your coding. However, I also encourage you to spend some time trying to find a solution to any coding problems yourself as this is a core competency when it comes to coding. A bit of frustration is part of the coding experience, but hopefully this will be compensated by the feeling of accomplishment when you get it running. If you are new to `R` or programming in general, you will likely have many questions initially, but I assure you that the learning curve is very steep and you will improve quickly.
