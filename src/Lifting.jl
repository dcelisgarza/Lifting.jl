module Lifting
using DelimitedFiles
using DataFrames
using Dates
using Dierckx
using Plots
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
    adjustMaxes!,
    updateMaxes!,
    calcTrainingMaxLogs,
    intensityArb,
    SetScheme,
    Progression,
    Exercise,
    calcWeights,
    Programme
include("LiftingIO.jl")
export numDays, loadLogFile, loadLogFile, plotData, plotData!
end # module
