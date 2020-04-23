module Lifting
using DelimitedFiles

include("LiftingTypes.jl")
export AbstractProgression,
    AbstractProgramme,
    LinearProgression,
    DoubleProgression,
    PeriodProgression,
    BlockProgression
export calcIntensity,
    calcRPE,
    calcReps,
    calcIntensityRatio,
    calcRPERatio,
    calcRepsRatio,
    calcRepMax,
    adjustRepMax,
    updateRepMax,
    intensityArb,
    SetScheme,
    Progression,
    Exercise,
    calcWeights,
    Programme
include("LiftingIO.jl")
end # module
