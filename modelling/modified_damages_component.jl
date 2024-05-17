@defcomp modified_damages begin
    DAMAGES = Variable(index=[time])    #Damages (trillions 2010 USD per year)
    DAMFRAC = Variable(index=[time])    #Damages (fraction of gross output)

    TATM    = Parameter(index=[time])   #Increase temperature of atmosphere (degrees C from 1900)
    YGROSS  = Parameter(index=[time])   #Gross world product GROSS of abatement and damages (trillions 2010 USD per year)
    a1      = Parameter()               #Damage coefficient
    a2      = Parameter()               #Damage quadratic term
    a3      = Parameter()               #Damage exponent

    tatm0   = Parameter()               # Initial atmospheric temp change (C from 1900)

    function run_timestep(p, v, d, t)
        #Define function for DAMFRAC
        if is_first(t)
            v.DAMFRAC[t] = p.a1 * p.TATM[t] + p.a2 * p.TATM[t] ^ p.a3 + 0.5 * p.a2 * p.tatm0 ^ p.a3
        else
            v.DAMFRAC[t] = p.a1 * p.TATM[t] + p.a2 * p.TATM[t] ^ p.a3 + 0.5 * p.a2 * p.TATM[t-1] ^ p.a3
        end
    
        #Define function for DAMAGES
            v.DAMAGES[t] = p.YGROSS[t] * v.DAMFRAC[t]
        end
    end