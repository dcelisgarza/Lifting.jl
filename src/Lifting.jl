module Lifting
using DelimitedFiles
using DataFrames
using Plots
using Dates

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
    adjustMaxes,
    updateMaxes,
    intensityArb,
    SetScheme,
    Progression,
    Exercise,
    calcWeights,
    Programme
include("LiftingIO.jl")
export numDays, loadLogFile, calcTrainingMaxLogs, loadLogFile
end # module
