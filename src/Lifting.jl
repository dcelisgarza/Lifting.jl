module Lifting
using DelimitedFiles

include("LiftingTypes.jl")
export AbstractProgression,
    LinearProgression, DoubleProgression, PeriodProgression, BlockProgression
export calcIntensity,
    calcRPE,
    calcReps,
    calcIntensityRatio,
    calcRPERatio,
    calcRepsRatio,
    calcRepMax,
    updateRepMax,
    intensityArb,
    SetScheme,
    Progression,
    Exercise,
    calcWeights,
    Programme
include("LiftingIO.jl")
end # module
