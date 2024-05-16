##############################################################
#%%
# Optimising DICE
##############################################################

pwd()
cd("./adv_env_econ_24/modelling")

using Pkg
Pkg.activate(".") # activate the current environment

# Pkg.add(url="https://github.com/felixschaumann/OptMimiDICE2016R2.jl")

#%%

using Mimi
using OptMimiDICE2016R2

m = OptMimiDICE2016R2.get_model()

run(m)

#%%

@time opt_DICE, diagn = OptMimiDICE2016R2.optimise_model(m)

