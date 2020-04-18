module Lifting

include("LiftingTypes.jl")
export AbstractProgression, LinearProgression, DoubleProgression, PeriodProgression, BlockProgression
export intensity, intensityArb, SetScheme, Progression, Exercise, calcWeights, Programme
include("LiftingIO.jl")
end # module
