# Advanced Environmental Economics: Modelling and Empirical Approaches

- [Advanced Environmental Economics: Modelling and Empirical Approaches](#advanced-environmental-economics-modelling-and-empirical-approaches)
  - [How to use this repository](#how-to-use-this-repository)
    - [How to get this repository on your computer](#how-to-get-this-repository-on-your-computer)
  - [Software Requirements](#software-requirements)
    - [Julia](#julia)
    - [R](#r)
    - [Integrated Development Environment (IDE)](#integrated-development-environment-ide)
      - [VSC Extensions](#vsc-extensions)
  - [Modelling Approaches](#modelling-approaches)
  - [Empirical Approaches](#empirical-approaches)
  - [Contact](#contact)

---

## How to use this repository 

The idea behind this repository (=folder) is to have one place that contains all relevant materials: slides, tutorials, scripts, ... The advantage of using a git repository is that it is designed such that you all can download (or clone) it and easily keep it synced to the newest version that's hosted here in Github. That way, we are all on the same page and have the same files to work with.

This file here is called a `README`. As the name suggests, this is the first thing one is supposed to read when looking at a directory. We have made two subfolders for the respective hands-on parts - empirics and modelling - which each have a more specific `README` file in their respective subdirectory.

### How to get this repository on your computer

The easiest way for most people to obtain a local copy of the repository is via GitHub Desktop, which can be downloaded [here](https://desktop.github.com/). Once you have installed the software, you can clone our online repository on your computer. To do this, follow the steps described [here](https://docs.github.com/en/desktop/adding-and-cloning-repositories/cloning-and-forking-repositories-from-github-desktop#cloning-a-repository). When the window titled `Clone a repository` opens, you can choose to clone from a URL, which should be `https://github.com/ccs282/adv_env_econ_24.git`. Set the local path under which the repository should be saved on your computer and you should be good to go. For more information on the workflow with Github Desktop, check out the helpful documentation on the [website](https://docs.github.com/en/desktop).

Over time, the repository will evolve as more slides, tutorials, and code snippets are uploaded. You can then `Pull` these changes from the web onto our computer using GitHub Desktop.

For alternative ways of getting this Github repository onto your own computer, see also [here](./modelling/README.md#3-opening-the-jupyter-notebook). Feel free to contact us about any Github-related questions. We will also continue to put slides onto Stine.

---

## Software Requirements

### Julia

For the hands-on modelling part of the lecture, we are gonna be working in [`Julia`](https://julialang.org). Specifically, we're gonna be using the [`Mimi` package](https://www.mimiframework.org/).

Go to the [modelling README](./modelling/README.md) to see more on how to install Julia, open Jupyter Notebooks and working with Mimi.

### R

For the empirical part of this course, the free software R is required and can be downloaded [here](https://www.r-project.org/).

Once you have installed the software, open R (e.g., by clicking on it in the list of apps installed on your laptop). Next, run the following code to install a package that is required to run R in Visual Studio Code (see [below](#integrated-development-environment-ide)).

```r
install.packages("languageserver")
```

### Integrated Development Environment (IDE)

We recommend working with an IDE such as [Visual Studio Code (VSC)](https://code.visualstudio.com/) as it offers a wide range of extensions and accommodates most popular programming languages. VSC can be downloaded free of charge [here](https://code.visualstudio.com/download).

VS Code is an open-source code editor maintained by Microsoft. You can use a non-Microsoft version without any trackers through [VSCodium](https://vscodium.com/), which is identical but lacks some Microsoft extensions such as _Copilot_ or _Remote-SSH_.

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
