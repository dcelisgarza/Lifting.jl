using Lifting, DelimitedFiles, Dates, Plots
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



data = readdlm("Log_" * programme["nSunsCAP3_OHP_6Day_LP"].name * ".csv", ',')
function numDays(dates; format = "dd/mm/yyyy")
    # Range for the date map.
    lrange = range(1, stop = length(dates))
    # Turns date string into date format.
    tdates = map(x -> Date(dates[x], format), lrange)
    # Calculate the number of days from the beginning.
    days = map(x -> (tdates[x] - minimum(tdates)).value, lrange)

    return days
end
function getContinuousData(data, start, step=4, last=0)
    T = typeof(data[2,start])
    T == SubString{String} ? T = String : nothing
    arr :: Vector{Vector{T}} = []
    for i in 2:size(data,1)
        push!(arr, data[i,start:step:end])
    end
    return arr
end
name = data[2:end,1]
days = numDays.(getContinuousData(data, 2))
reps = getContinuousData(data, 3)
wght = getContinuousData(data, 4)
rpe = getContinuousData(data, 5)

prog = programme["nSunsCAP3_OHP_6Day_LP"]


simReps = rand(1:16,32)
simWght = rand(20:150,32)
for i in 1:32
    reps[i][1] = simReps[i]
    wght[i][1] = simWght[i]
end

updateRepMax(prog, name, reps)
function calcTrainingMaxLogs(prog::Programme, name, reps, weight)
    tm = weight
    for i in 1:length(name)
        for j in 1:length(reps[i])
            tm[i][j] = adjustRepMax(name[i], prog.exerProg, reps[i][j]; weight = wght[i][j])
        end
    end
    return tm
end
tm = calcTrainingMaxLogs(prog, name, reps, wght)

tm
wght

prog

# push!(days[1], 1)
# push!(days[1], 2)
# push!(days[1], 3)
#
# plot(days[1], [0,1,2,3])


# function calcRepMax(
#     weight::Real,
#     actualReps::Integer,
#     actualRPE::Real,
#     targetReps::Integer,
#     targetRPE::Real,
# )

# push!(days[1], 5)
# days
# plot(days[1][1], data[1,3])
# data
# prog = programme["nSunsCAP3_OHP_6Day_LP"]
# updateRepMax(prog)
# adjustRepMax("DeadliftT1", exerProg, 15)
# prog.days .= makeDays(prog.type, prog.exerProg)
