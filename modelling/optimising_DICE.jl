##############################################################
#%%
# Optimising DICE
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
# Replacing MimiDICE2016R2 with OptMimiDICE2016R2
##############################################################

# OptMimiDICE2016R2 is a fork of MimiDICE2016R2 that includes an optimisation routine. Because they share the same package ID, we need to remove MimiDICE2016R2 before adding OptMimiDICE2016R2.
# You need to do this only once. After that, you can comment out the following lines.

Pkg.rm("MimiDICE2016R2")
Pkg.add(url="https://github.com/felixschaumann/OptMimiDICE2016R2.jl")

##############################################################
#%%
# Running and optimising DICE
##############################################################

using Mimi
using OptMimiDICE2016R2

m_opt = OptMimiDICE2016R2.get_model()
run(m_opt)

@time m_opt, diagn = OptMimiDICE2016R2.optimise_model(m_opt)

# Note that in this optimised version, emissions and temperature are lower than in the baseline DICE model.
explore(m_opt)

# Again, you can change parameters, or components, and re-run the optimisation to see how the model behaves under different conditions.