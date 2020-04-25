using Lifting
# using DataFrames
cd(@__DIR__)
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")
include("nSunsCAP3_OHP_6Day_LP.jl")
save = false
if save
    for key in keys(programme)
        write(programme[key].name * ".csv", programme[key])
        write(programme[key].name * ".csv", programme[key], log = true)
    end
end

# write(programme["nSunsCAP3_OHP_6Day_LP"].name * ".csv", programme["nSunsCAP3_OHP_6Day_LP"], log = true)



name = "nSunsCAP3_OHP_6Day_LP"
prog = programme[name]
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(programme, name)
tm = calcTrainingMaxLogs(prog, keyArr, reps, wght)
keyArr
reps
updateMaxes(prog, keyArr, reps)
