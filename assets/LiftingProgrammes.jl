using Lifting
# using Plots
# using Dierckx
# using DataFrames
cd(@__DIR__)
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")
include("nSunsCAP3_OHP_6Day_LP.jl")
save = false
log = false
if save
    for key in keys(programme)
        write(programme[key].name * ".csv", programme[key])
        log ? write(programme[key].name * ".csv", programme[key], log = log) : nothing
    end
end

name = "nSunsCAP3_OHP_6Day_LP"
prog = programme[name]
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(programme, name)
tm = calcTrainingMaxLogs(prog, keyArr, reps, wght)

rpe["wristCurl"]
figs = plotData(prog, keyArr, Δdays, tm; xlabel = "Days", ylabel = "Weight", lw=3)
display.(figs)
prog.exerProg["BenchT2"].exercise.trainingMax
updateMaxes(prog, keyArr, reps)
updateMaxes!(prog, keyArr, reps)
