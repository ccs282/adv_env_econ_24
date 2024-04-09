# Advanced Environmental Economics: Modelling and Empirical Approaches

[toc]

<!-- - [Advanced Environmental Economics: Modelling and Empirical Approaches](#advanced-environmental-economics-modelling-and-empirical-approaches)
  - [How to use this repository](#how-to-use-this-repository)
  - [Software Requirements](#software-requirements)
    - [Julia](#julia)
    - [R](#r)
    - [Integrated Development Environment (IDE)](#integrated-development-environment-ide)
      - [VSC Extensions](#vsc-extensions)
  - [Modelling Approaches](#modelling-approaches)
  - [Empirical Approaches](#empirical-approaches)
  - [Contact](#contact) -->

---

## How to use this repository

---

## Software Requirements

### Julia

For the hands-on modelling part of the lecture, we are gonna be working in [`Julia`](https://julialang.org). Specifically, we're gonna be using the [`Mimi` package](https://www.mimiframework.org/Mimi.jl/stable/).

### R

For the empirical part of this course, the free software R is required and can be downloaded [here](https://www.r-project.org/).

Once you have installed the software, open R (e.g., by clicking on it in the list of apps installed on your laptop). Next, run the following code to install a package that is required to run R in Visual Studio Code (see [below](#integrated-development-environment-ide)).

```r
install.packages("languageserver")
```

### Integrated Development Environment (IDE)

We recommend working with an IDE such as Visual Studio Code (VSC) as it offers a wide range of extensions and accommodates most popular programming languages. VSC can be downloaded free of charge [here](https://code.visualstudio.com/download).

While you can also work in [RStudio](https://posit.co/downloads/) when working with R, the course will be taught using VSC and we encourage you to try it out.

#### VSC Extensions

You can access the extensions menu on the sidebar or via `Ctrl+Shift+X` on Windows/Linux or `⇧⌘X` on macOS. In this menu, you should install the following extensions. You can find them by searching for the extension ID in the extension marketplace.

| Extension | Extension ID | Notes |
| --- | --- | --- |
| `Jupyter` | `ms-toolsai.jupyter` | This is for opening Juptyer notebooks (see [here](./modelling/README.md)) |
| `R` | `REditorSupport.r` | Make sure you have installed R and the R package `languageserver` (for instructions see [here](https://github.com/REditorSupport/vscode-R.git) or [above](#r)). |
| `Julia` | `julialang.language-julia` | x |

---

## Modelling Approaches

The materials required for the empirical part of this course are located under [./modelling](./modelling). You will find instructions in the [README](./modelling/README.md) file of this subfolder.

---

## Empirical Approaches

The materials required for the empirical part of this course are located under [./empirical/](./empirical/). You will find instructions in the README file of this subfolder.

---

## Contact

For specific questions on the modelling or empirical part, feel free to reach out to [Felix Schaumann](mailto:felix.schaumann@uni-hamburg.de) and [Jonas Grunau](mailto:jonas.sebastian.grunau@uni-hamburg.de), respectively.
