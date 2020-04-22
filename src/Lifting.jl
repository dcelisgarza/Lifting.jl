module Lifting

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
    intensityArb,
    SetScheme,
    Progression,
    Exercise,
    calcWeights,
    Programme
include("LiftingIO.jl")
end # module
