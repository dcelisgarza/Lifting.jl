module Lifting

include("LiftingTypes.jl")
export AbstractProgression, LinearProgression, DoubleProgression, PeriodProgression, BlockProgression
export intensity, RPE, intensityArb, SetScheme, Progression, Exercise, calcWeights, Programme, showDays
include("LiftingIO.jl")
end # module
