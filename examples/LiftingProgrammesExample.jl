using Revise
using Lifting
import Lifting:
    Lifting_Programmes, Lifting_Aux, Lifting_Exercise_Names, Lifting_Progressions
cd(@__DIR__)

name = "nSunsCAP3_OHP_6Day_LP"

# Uncomment to print whole programme.
println(Lifting_Programmes[name])
# Prints the days provided in the second argument.
println(Lifting_Programmes[name], [2, 6, 9])

println(Lifting_Programmes[name], length(Lifting_Programmes[name].days))

write("yugenstronk.csv", Lifting_Programmes["DCG_YugeStr"]; log = true)
#= 
# Writes programme to test.cvt
write("test.csv", Lifting_Programmes[name]; log = false)
# Writes days provided in the third argument programme to test.cvt
write("test.csv", Lifting_Programmes[name], [9,15,21]; log = false)
# Write csv file for logging reps, weight and performance for all the lifts. Open the file up in google docs and be log your stuff there.
write("test.csv", Lifting_Programmes[name]; log = true) =#
# Makes a complete copy of the lifting programme with the given name.
prog = deepcopy(Lifting_Programmes[name])

# Loads log file data. Returns dictionaries whose keys are the exercise names.
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(prog)

# Calculates training maxes depending on the weight and reps provided but accounting for intensity defined in the progression.
tm, change = calcTrainingMaxLogs(prog, keyArr, reps, wght)

tm
change
# Plots lifts individually and uses a cubic spline to interpolate values.
figs = plotData(prog, keyArr, Δdays, tm; xlabel = "Days", ylabel = "Weight", lw = 3)
for (i, fig) in enumerate(figs)
    scatterData!(
        fig,
        prog,
        keyArr[i],
        Δdays,
        tm;
        shape = :circle,
        markersize = 5,
        label = "",
    )
end
figs
display.(figs)

# Calculates training maxes depending on the weight and intensities used in the progression and the reps provided.
updateMaxes(prog, keyArr, reps)

# Same as above but also updates the programme with the new values. Run this a couple of times and see how the training maxes change by running the one above.
updateMaxes!(prog, keyArr, reps)


write("nSunsCAP3_RPE.csv", Lifting_Programmes["nSunsCAP3_RPE"])
println(Lifting_Programmes["nSunsCAP3_RPE"], 22)


Lifting_Programmes["DCG_CAP4"]

write("DCG_CAP4.csv", Lifting_Programmes["DCG_CAP4"])
write("DCG_CAP4.csv", Lifting_Programmes["DCG_CAP4"]; log = true)
println(Lifting_Programmes["DCG_CAP4"]) 
println(Lifting_Programmes["DCG_CAP4"], [1,8,16,23]) # Bench T11 & Bench T21
println(Lifting_Programmes["DCG_CAP4"], [2,9,17,24]) # DL T2 & Row T1
println(Lifting_Programmes["DCG_CAP4"], [3,11,18,26]) # Squat T1 & OHP T2
println(Lifting_Programmes["DCG_CAP4"], [4,12,19,27]) # Bench T12 & Bench T22
println(Lifting_Programmes["DCG_CAP4"], [6,13,21,28]) # DL T1 & Row T2
println(Lifting_Programmes["DCG_CAP4"], [7,14,22,30]) # OHP T1 & Squat T2