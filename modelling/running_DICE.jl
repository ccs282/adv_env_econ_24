##############################################################
#%%
# Running DICE
##############################################################

# In this notebook, we are going to do the following things:

# 1. Activate a Julia environment in our `adv_env_econ_24/modelling` folder
# 2. Make sure that the right packages are installed
# 3. Import the packages `Mimi` and `MimiDICE2016R2`
# 4. Build the standard baseline DICE model
# 5. Explore the baseline DICE model in an interactive window

##############################################################
#%%
# 1. Activate Julia environment "modelling"
##############################################################

# go to subdirectory "modelling" (assuming you are in adv_env_econ_24)
# if this step fails, you can check which directory you are in by running `pwd()` and then navigate to the correct directory using `cd("path")`
cd("./modelling")

# check the current directory (should be ".../adv_env_econ_24/modelling")
pwd()

using Pkg
Pkg.activate(".") # activate the current environment

##############################################################
#%%
# 2. Check which packages are installed in "modelling"
##############################################################

Pkg.status()

# Compile all the packages:

Pkg.instantiate()

# For the first time running this notebook, you may need to manually install MimiDICE2016R2 with the following command:

Pkg.add(url="https://github.com/anthofflab/MimiDICE2016R2.jl")

##############################################################
#%%
# 3. Import the packages 
##############################################################

using Mimi
using MimiDICE2016R2

##############################################################
#%%
# 4. Build the baseline DICE model
##############################################################

m = MimiDICE2016R2.get_model()
run(m)

##############################################################
#%%
# 5. Explore the results
##############################################################

explore(m)
