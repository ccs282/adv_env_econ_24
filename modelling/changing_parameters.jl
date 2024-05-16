##############################################################
#%%
# Changing parameters in a Mimi Model
##############################################################

# This is meant as a simple hands-on example that can be readily executed and adapted. More thorough documentation, explanation and examples can be found [here](https://www.mimiframework.org/Mimi.jl/stable/tutorials/tutorial_3/).

# go to subdirectory "modelling" (assuming you are in adv_env_econ_24)
# if this step fails, you can check which directory you are in by running `pwd()` and then navigate to the correct directory using `cd("path")`
cd("./modelling")

##% check the current directory (should be ".../adv_env_econ_24/modelling")
pwd()

using Pkg;
Pkg.activate(".") # activate the environment in the "modelling" folder
Pkg.instantiate() # install the packages in the environment

##############################################################
#%%
# 1. Modifying DICE parameters
##############################################################


# Let's start by changing something in the DICE model. Here's a table with parameters that might be worthwile playing around with:

# | Parameter symbol | Component | Name and meaning | Source code |
# | --- | --- | --- | --- | 
# | `:a2` | `:damages` | quadratic coefficient of damage function| [&rarr;](https://github.com/felixschaumann/OptMimiDICE2016R2.jl/blob/main/src/components/damages_component.jl) |
# | `:t2xco2` | `:climatedynamics` | equilibrium climate sensitivity | [&rarr;](https://github.com/felixschaumann/OptMimiDICE2016R2.jl/blob/main/src/components/climatedynamics_component.jl) |
# | `:elasmu` | `:welfare` | elasticity of marginal utility of consumption | [&rarr;](https://github.com/felixschaumann/OptMimiDICE2016R2.jl/blob/main/src/components/welfare_component.jl) |
# | `:rr` | `:welfare` | social discount rate (factor?) | [&rarr;](https://github.com/felixschaumann/OptMimiDICE2016R2.jl/blob/main/src/components/welfare_component.jl) |

##% Note that when you adapt a certain parameter and run the model again, all the model variables will update according to the new equations and parameter values, but the model will **not optimise welfare**! `MimiDICE2016R2` is a simulation model that does not feature optimisation. That is, it can be used to evaluate the SCC along a certain path, but it does not welfare-optimise. If you want to be able to optimise, check out the [`OptMimiDICE2016R2` package](https://github.com/felixschaumann/OptMimiDICE2016R2.jl).

using Mimi
using MimiDICE2016R2

m_DICE = MimiDICE2016R2.get_model()
run(m_DICE)

# `m_DICE` is a standard DICE model for which we can explore results with `explore(m_DICE)`. Before we do that, let's change some parameters.

##% Howard & Sterner damage specification including productivity effect
update_param!(m_DICE, :damages, :a2, 0.01145)
run(m_DICE)

m_DICE[:damages, :DAMAGES]

# The last line, following the syntax `model[:component, :variable]`, let's you look at the vector of time steps of a certain variable. In this case, we can see, how the damages over time change after having altered a damage function parameter.

##% A particularly low climate sensitivity (normally around 3)
update_param!(m_DICE, :climatedynamics, :t2xco2, 2)

m_DICE[:climatedynamics, :TATM]

#%% Let's calculate the SCC. See [here](https://github.com/anthofflab/MimiDICE2016R2.jl?tab=readme-ov-file#calculating-the-social-cost-of-carbon).

# Get the social cost of carbon in year 2020 from the default MimiDICE2016R2 model:
scc = MimiDICE2016R2.compute_scc(m_DICE, year=2020, prtp=0.03)

# Now you can experiment which SCC values you get based on different parameters for the damage function, climate sensitivity, marginal elasticity of consumption, or the rate of pure time preference (`prtp` in the `compute_scc` function).

##############################################################
#%%
# 2. Modifying META parameters
##############################################################

# Let's first go into the directory of the META-2021 model.

cd("./META-2021/src") # change directory
include("../src/MimiMETA.jl")

#%%

include("./META-2021/src/MimiMETA.jl")

#%% Sometimes, it is necessary to run a simple `model` first. Seems to be a bug, but don't worry about ut.

model = base_model();
run(model);

#%%

m_base = base_model(rcp="RCP4.5", ssp="SSP2", tdamage="pointestimate", slrdamage="mode");
run(m_base);

m_full = full_model(rcp="RCP4.5", ssp="SSP2", tdamage="pointestimate", slrdamage="mode");
run(m_full);

#%%

include("./META-2021/scc.jl") # include the scc calculation file

scc_base = calculate_scc(m_base, 2020, 10., 1.5) # year 2020, emissions pulse 10Gt CO2, elasticity of marginal utility 1.5
scc_full = calculate_scc(m_full, 2020, 10., 1.5)

# Again, as in the case for DICE, you can try to vary parameters, look at the current parameter values with `model[:component, :parameter]`, and change them using `update_param!` and `run`. 

# See more information on running the META model and calculating SCC values [here](https://github.com/openmodels/META-2021?tab=readme-ov-file#mimi-model).