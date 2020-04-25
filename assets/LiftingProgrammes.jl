using Lifting
using Plots
using Dierckx
# using DataFrames
cd(@__DIR__)
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")
include("nSunsCAP3_OHP_6Day_LP.jl")
save = true
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
reps["BenchT2"]
tm = calcTrainingMaxLogs(prog, keyArr, reps, wght)
plot(Δdays[keyArr[1]], tm[keyArr[1]], label = prog.exerProg[keyArr[1]][1].name, lw=2)
spl = Spline1D(Δdays[keyArr[1]], tm[keyArr[1]], k=3)
x = range(Δdays[keyArr[1]][1]; stop = Δdays[keyArr[1]][end], step=0.25)
plot!(x, spl(x), lw=3)
updateMaxes(prog, keyArr, reps)

findall("BenchT2", keyArr)
