using Lifting
cd(@__DIR__)
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")
include("nSunsCAP3_OHP_6Day_LP.jl")
save = false
if save
    for key in keys(programme)
        write(programme[key].name * ".csv", programme[key])
        write(programme[key].name * ".csv", programme[key], log = true)
    end
end

# prog = programme["nSunsCAP3_OHP_6Day_LP"]
# updateRepMax(prog)
# adjustRepMax("DeadliftT1", exerProg, 15)
# prog.days .= makeDays(prog.type, prog.exerProg)
