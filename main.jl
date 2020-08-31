using Revise, Lifting
import Lifting:
    Lifting_Programmes, Lifting_Aux, Lifting_Exercise_Names, Lifting_Progressions
cd(@__DIR__)
name = "nSunsCAP3_OHP_6Day_LP"

# Uncomment to print whole programme.
println(Lifting_Programmes[name])
write("programme.csv", Lifting_Programmes[name])
Lifting_Programmes[name].exerProg["bulgarianSplit"].progression
Lifting_Programmes[name]

calcIntensity(6, 8.5)


println(keys(Lifting_Programmes[name].exerProg))

name = "DCG_YugeStr"
Lifting_Programmes[name].days
println(Lifting_Programmes[name], 1)

write("Yuge_n_Stronk.csv", Lifting_Programmes[name])
