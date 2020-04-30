using Lifting
import Lifting: Lifting_Programmes, Lifting_Aux, Lifting_Exercise_Names, Lifting_Progressions
cd(@__DIR__)

name = "nSunsCAP3_OHP_6Day_LP"

# Uncomment to print whole programme.
println(Lifting_Programmes[name])
# Prints the days provided in the second argument.
println(Lifting_Programmes[name], [2,6,9])

println(Lifting_Programmes[name], length(Lifting_Programmes[name].days))

#=
# Writes programme to test.cvt
write("test.csv", Lifting_Programmes[name]; log = false)
# Writes days provided in the third argument programme to test.cvt
write("test.csv", Lifting_Programmes[name], [9,15,21]; log = false)
# Write csv file for logging reps, weight and performance for all the lifts. Open the file up in google docs and be log your stuff there.
write("test.csv", Lifting_Programmes[name]; log = true)
=#
# Makes a complete copy of the lifting programme with the given name.
prog = deepcopy(Lifting_Programmes[name])

# Loads log file data. Returns dictionaries whose keys are the exercise names.
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(prog)

# Calculates training maxes depending on the weight and reps provided but accounting for intensity defined in the progression.
tm, change = calcTrainingMaxLogs(prog, keyArr, reps, wght)

tm
# Plots lifts individually and uses a cubic spline to interpolate values.
figs = plotData(prog, keyArr, Δdays, tm; xlabel = "Days", ylabel = "Weight", lw=3)
for (i, fig) in enumerate(figs)
    scatterData!(fig, prog, keyArr[i], Δdays, tm; shape = :circle, markersize=5, label="")
end
display.(figs)

# Calculates training maxes depending on the weight and intensities used in the progression and the reps provided.
updateMaxes(prog, keyArr, reps)

# Same as above but also updates the programme with the new values. Run this a couple of times and see how the training maxes change by running the one above.
updateMaxes!(prog, keyArr, reps)
