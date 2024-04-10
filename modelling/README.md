# Modelling in climate economics

For this hands-on part of the lecture, we are gonna be working in [`Julia`](https://julialang.org). Specifically, we're gonna be using the [`Mimi` package](https://www.mimiframework.org/Mimi.jl/stable/).

Most of the materials to start with are gonna be included in a Jupyter Notebook. So this `README` will guide you until you're gonna be at the stage where you can yourself open the Jupyter Notebook in your local VS Code installation and play around with the code. But let's start step by step.

## Homework (assigned April 11th, due April 25th)

You don't have to submit anything, but do try to go through the following steps by yourself:

1. Install Julia
1. Install VS Code
3. Open the [Jupypter Notebook]()
4. Test your Julia installation
3. Install Mimi
4. Download DICE2016
5. Run and explore DICE2016
6. Be happy if it all went smoothly, don't despair in case it didn't :)

## 1. Install Julia

Go to [https://julialang.org/downloads/](https://julialang.org/downloads/) and select the current stable release file according to your operating system.

If you're brave, you follow the suggestion of the box and install Julia using your terminal. You'll just need to open your command prompt (Windows) or terminal (Mac and Linux), paste in the one line of code and press `Enter`. This method is the most fail-safe.

## 2. Installing VS Code

To install VSC, see [here](../README.md#integrated-development-environment-ide). Make sure you have the Jupyter and the Julia extension installed. Installing the Jupyter extension should automatically install `Jupyter Cell Tags`, `Jupyter Slide Show`, `Jupyter Keymap`, and `Jupyter Notebook Renderer`. In case it doesn't, do install those extensions as well.

Normally, the VS Code Julia extension should be able to find your Julia installation and connect them. In case you run into problems later (if your Julia installation is not found), you might have to configure your VS Code Julia extension with the exact path of the Julia installation. You can read up on how to do this [here](https://www.julia-vscode.org/docs/dev/gettingstarted/#Installation-and-Configuration).

## 3. Opening the Jupyter Notebook

Now, you should be able to open this Jupyter Notebook with the VS Code installation on your computer. The simplest way is to manually download this file and the folder it's in from the Github website, and open it with VS Code. 
To manually download a git repository, click on the top-right green box that says `< > Code` and select `Download ZIP`.
The pro way of doing it is to use `git clone` to clone the whole Github repository and open it with VS Code. If you're into nerdy stuff, I'll add a [short box on `git`](#git), otherwise just move on. 
On the general idea behind Github, see [here](../README.md#how-to-use-this-repository). 

If you're wondering what exactly a Jupyter Notebook is, see [here](#jupyter-notebooks) in the [section with useful nerdy stuff](#section-with-useful-nerdy-stuff).

The easiest way of opening anything in VS Code is to open the folder that contains it. So first, open VS Code itself and then click `Ctrl+O` on Windows/Linux or `⌘O` on Mac to open the folder that contains the Notebook. Most likely, this folder is called `adv_env_econ_24`. Once you have successfully opened the folder within VS Code, you can use the file explorer in the left sidebar to navigate to the Notebook and open it. You will also be able to find this file here in the explorer under the path `adv_env_econ_24/modelling/README.md`.

The rest of the homework will take place within the now (hopefully) opened notebook. In case you didn't manage to open it, feel free to [contact me](mailto:felix.schaumann@uni-hamburg.de).

___

## Section with useful nerdy stuff

### The terminal

> **Speaking to the computer directly**
> 
>

### Git

> **The nerdy way of doing things properly**
> 
> `git` is a (the) version control system. That means, it's a tool that allows you to track changes within a folder over time. You will never, ever have to name documents `Document_v1`, `Document_final`, or `Document_really_properly_final` anymore, but instead you can keep your one `Document` file and use git as a time machine to change between different versions.

### Jupyter Notebooks

>**How exactly does a Jupyter notebook work?**
>
>A Jupyter notebook is a long list of cells, and the cells can be of two different types: text (more specifically: `markdown`) or code. In text cells, one can make headers, put links, explain what's going on, add pictures, etc. In code cells, one can - surprise - put code and then run every cell as its separate unit. This is really handy if you want to do things step-by-step, check out intermediate output, and not run everything from scratch again just to change a minor detail.
>
>On the top right of your notebook (see screenshot below), one can chose the "kernel"; that is, the programming language installation with which the code cells should be executed. In this case, you should select the kernel that corresponds to the Julia installation on you computer. But in principle, Jupyter notebooks also work for other modern programming languages like Python or R (in fact, the name Jupyter points to JUlia, PYThon, and R).
> ![A screenshot of the top bar of a notebook when opened in VS Code to highlight the selected kernel](./screenshots/vsc_notebook_top_bar.png)
<!-- >![image.png](attachment:image.png) -->