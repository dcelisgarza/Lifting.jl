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
    calcRepRatio,
    calcRPERatio,
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
    Programme,
    makeDays,
    numDays
include("LiftingIO.jl")
export numDays,
    loadLogFile, loadLogFile, plotData, plotData!, scatterData, scatterData!

include("./assets/LiftingAssets.jl")
# Default dictionaries, uncomment to auto export.
# export Lifting_Aux
# export Lifting_Exercise_Names
# export Lifting_Progressions
# export Lifting_Programmes

end # module
