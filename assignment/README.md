# Advanced Environmental Economics (22-30.104): Graded Assignment

## Instructions

Welcome to the graded assignment. It is now time to put what you have learned in this course into practice.

Please submit an **ordered list of preferences** of five topics for the assignment **until Tuesday, 21 May, 2pm** via email to all three of us ([Moritz Drupp](mailto:moritz.drupp@uni-hamburg.de), [Jonas Grunau](mailto:jonas.sebastian.grunau@uni-hamburg.de), [Felix Schaumann](mailto:felix.schaumann@uni-hamburg.de)) with the header "AEETopics {Your Surname}". The email text should be something like this: "{Surname}, M1, M2, M3, E1, E3". Soon after, you will get assigned **one** of the five topics.

See [below](#instructions-for-the-modelling-track) for the instructions on the modelling and empirical track, respectively.

The **deadline** is Thursday, 21 June 2024, 11:59pm. The **world limit** for your term paper is 5000 words.

### Instructions for the modelling track

For the project work, you should familiarise yourself with an existing extension of a simple IAM, implement it in Mimi and alter the model based on an original research idea. It can be a simple idea, but it has to go beyond what the authors of the reference paper already did.

The **final paper** should address the following points:

1. What is the rationale for this model extension?
2. How did you implement the existing extension in Mimi?
3. How did you alter the existing model?
4. Why did you introduce these changes?
5. Provide at least one figure of your results.
6. Critically discuss both the existing extension and your own changes, addressing uncertainties, model limitations, and what be learned from your results.

Please submit both your **paper** as well as the **repository** with your code. Make sure your code is fully understandable and reproducible.

You can share the repository either via Email using software such as [WeTransfer](https://wetransfer.com/) or invite me as a collaborator on GitHub (see [here](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository) how to do it; my username is [felixschaumann](https://github.com/felixschaumann)).

### Instructions for the empirical track

#### Task

If you get assigned one of the topics from the empirical track, you should extend a paper's analysis by an additional robustness test or further analysis. The papers all aim at identifying some causal relationship, and it is your task to enhance the analysis in this respect. For instance, if a paper first identifies the causal impact of temperatures on mortality and, second, makes projections into the future leveraging the estimates from the first step, you are expected to extend the causal estimation part of the *first* part.

#### Content of your paper

In your paper, you should:

- *Briefly* introduce the paper you are extending.
  - i.e., briefly state the research question, its relevance, main empirical approach, findings and conclusions drawn
- State the empirical challenge of identifying the causal relationship the authors face and how they address it with their methodology.
  - Might be useful to think about the 'perfect experiment' first and then state how the authors' approach tries to mimic this
  - State the underlying assumptions of the approach.
  - List the robustness tests conducted by the authors and how this relates to the identifying assumptions.  
&rarr; *Note*: Everything until here is not the main contribution of your paper. In terms of words, it could be around 30-40% of your paper. Focus on your extension.
- Motivate and describe your extension.
  - What exactly are you doing?
  - How does it complement the analysis of the paper?
  - How does it relate to the identifying assumptions?
- Present the results of your extension
  - You are encouraged to use figures or tables to communicate the results, accompanied by a description in the text.
- Discuss your extension
  - What new insights has your extension provided?
  - What are the limitations?
  - What would you do differently/additionally if you could?

#### Submission requirements

Please submit both your **paper** as well as the **repository** with your code and data.

In the repository, you do not need to include all code and data that is used in the original repository of the paper you are extending but only the code and data that are necessary to run your extensions/robustness tests/create additional figures. Make sure your code is fully reproducible, i.e., work with relative paths and list all library calls at the beginning of your script. Check out [my replication file](../empirical/src/zaklan_replication.r) for an example of how to facilitate reproducibility.

You can share the repository either via Email using software such as [WeTransfer](https://wetransfer.com/) or invite me as a collaborator on GitHub (see [here](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository) how to do it; my username is [ccs282](https://github.com/ccs282)).

You are strongly encouraged to use `R` in your analysis. However, as the original repositories (see [here](#track-ii-causal-identification)) also contain analyses in `Stata`, it is also acceptable to work in `Stata` if that makes it more feasible for you. Again, please ensure easy reproducibility, which involves avoiding hard coding of absolute paths.

---

## Track I: Integrated Assessment Modelling

Each of the topics is based on a specific IAM extension.

### M1: Natural capital in IAMs

#### Main reference

- [Bastien-Olvera & Moore (2021, _Nature Sustainability_)](https://www.nature.com/articles/s41893-020-00615-0) &rarr; **GreenDICE** model

#### Further references

- [Bastien-Olvera & Moore (2022, _Annual Review of Resource Economics_)](https://www.annualreviews.org/content/journals/10.1146/annurev-resource-111820-020204)
- [Bastien-Olvera et al. (2023, _Nature_)](https://www.nature.com/articles/s41586-023-06769-z)

#### Implementation

The GreenDICE model is available on Github [here](https://github.com/BerBastien/GreenDICE). It is based on DICE2013, as opposed to the DICE2016 version we have been working with so far. There are two options: a) working with the model setup as it is, or b) implementing the changes in DICE2016 in order to have a cleaner modelling framework. I can help with questions arising in b).

### M2: Growth effects and the SCC

#### Main reference

- [Moore & Diaz (2015, _Nature Climate Change_)](https://www.nature.com/articles/nclimate2481) &rarr; **groDICE** model

#### Further references

- [Piontek at al. (2021, _Nature Climate Change_)](https://www.nature.com/articles/s41558-021-01065-y)
- [Kikstra et al. (2021, _ERL_)](https://iopscience.iop.org/article/10.1088/1748-9326/ac1d0b)

#### Implementation

The groDICE model is not available online. It is based on a two-region version of DICE called DICE-2R. However, the equations that need to be adjusted are not too complicated such that the qualitative dynamics can be integrated into DICE2016. Again, I am happy to help with questions.

### M3: Adaptation in global IAMs

#### Main reference

- [de Bruin et al. (2009, _Climatic Change_)](https://link.springer.com/article/10.1007/s10584-008-9535-5) &rarr; **AD-DICE** model

#### Further references

- [van Maanen et al. (2023, _Nature Climate Change_)](https://www.nature.com/articles/s41558-023-01644-1)
- [Agrawala et al. (2011, _Climate Change Economics_)](https://www.worldscientific.com/doi/abs/10.1142/S2010007811000267)

#### Implementation

The AD-DICE model is not available online. The way to go is hence to include the additional equations into DICE2016. Since adaptation is implemented as a policy variable, we need a model that is able to optimise. You can use [this optimising DICE2016 version](https://github.com/felixschaumann/OptMimiDICE2016R2.jl) as a package. You will, however, have to first remove MimiDICE2016R2 and then add OptMimiDICE2016R2, as the packages will otherwise conflict. I am happy to help with questions.

### M4: Tipping points and the SCC

#### Main reference

- [Dietz et al. (2021, _PNAS_)](https://www.pnas.org/doi/10.1073/pnas.2103081118) &rarr; **META** model

#### Further references

- [Nordhaus (2019, _PNAS_)](https://www.pnas.org/doi/abs/10.1073/pnas.1814990116)
- [Kessler (2017, _Climate Change Economics_)](https://www.worldscientific.com/doi/abs/10.1142/S2010007817500087)

#### Implementation

The META model is available on Github [here](https://github.com/openmodels/META-2021). It is, in contrast to the other topics, not an extenstion of the DICE model, but a model that is mainly used for estimating SCC values based on different scenarios. It is very well-documented in the [appendix of the PNAS paper](https://www.pnas.org/doi/10.1073/pnas.2103081118#supplementary-materials). Challenges when working with META can arise from the randomness that is used to model tipping points. This can make it harder to compare different model runs. With some tricks, the model can be made deterministic; I am happy to help with questions.

---

## Track II: Causal Identification

In contrast to the [modelling options](#track-i-integrated-assessment-modelling), the options in this track are distinct papers that each aim to shed light on a different causal relationship. If you have been assigned one of the topics from this track, please carefully read the instructions [above](#instructions-for-the-empirical-track).

### E1: The effectiveness of carbon pricing

#### Research article to be extended

[Andersson (2019)](https://doi.org/10.1257/pol.20170144)

The replication package is available [here](https://www.aeaweb.org/journals/dataset?id=10.1257/pol.20170144). The main analysis is conducted in `R`, but there are also `Stata` files in the repository.

#### Further resources

You might find [Abadie (2021)](https://doi.org/10.1257/jel.20191450) helpful as it provides a relatively recent overview of the variants and requirements of synthetic control methods.

### E2: The costs of natural disasters

#### Research article to be extended

[Deryugina (2017)](https://doi.org/10.1257/pol.20140296)

The replication package is available [here](https://doi.org/10.3886/E114620V1). The main analysis is conducted in `Stata`, but the author provides a clean final data set and descriptions in a README file.

#### Further resources

You might find [Roth et al. (2023)](https://doi.org/10.1016/j.jeconom.2023.03.008) helpful as they provide a great overview of advances and variants of difference-in-differences methods.

### E3: Climate change impacts

Identifying climate change impacts on economic or health outcomes is a particularly challenging endeavor in terms of data and coding infrastructure requirements. I recommend choosing this topic only if you have a solid background in coding and handling data or if you are up for a challenge.

<!-- Moreover, you can choose from one of two papers to see which one suits you better. -->

#### Research article to be extended

<!-- ##### Option 1 -->

[Burke & Emerick (2016)](https://doi.org/10.1257/pol.20130025)

The replication package is available [here](https://doi.org/10.3886/E114567V1). It is written mostly in `Stata`, but there are final data sets available. However, these contain *lots* of variables (~800), so you will need some time to get an overview. Note though that the number of variables is mostly due to the *wide* format of the data, so pivoting the data set could help depending on your plans. The documentation of the repository is suboptimal, but scrutinising the `.do` files and reading the paper should help you understand the data and the analysis.

#### Further resources

The following papers discuss different approaches and challenges of capturing weather vs. climate impacts and the role of adaptation:

- [Hsiang (2016)](https://doi.org/10.1146/annurev-resource-100815-095343)
- [Massetti & Mendelsohn (2018)](https://doi.org/10.1093/reep/rey007)
- [Kolstad & Moore (2020)](https://doi.org/10.1093/reep/rez024)
- [Cui (2020)](https://doi.org/10.1016/j.jeem.2020.102306)
- [Bento et al. (2023)](https://doi.org/10.1016/j.jeem.2023.102843)
