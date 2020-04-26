using Lifting
import Lifting: Lifting_Programmes
cd(@__DIR__)

name = "nSunsCAP3_OHP_6Day_LP"

# Uncomment to print whole programme.
println(Lifting_Programmes[name])
# Prints the days provided in the second argument.
println(Lifting_Programmes[name], [2,6,9])

println(Lifting_Programmes[name], 1:2:length(Lifting_Programmes[name].days))

# Writes programme to test.cvt
write("test.csv", Lifting_Programmes[name]; log = false)
# Writes days provided in the third argument programme to test.cvt
write("test.csv", Lifting_Programmes[name], [9,15,21]; log = false)
# Write csv file for logging reps, weight and performance for all the lifts. Open the file up in google docs and be log your stuff there.
write("test.csv", Lifting_Programmes[name]; log = true)

# Makes a complete copy of the lifting programme with the given name.
prog = deepcopy(Lifting_Programmes[name])

# Loads log file data. Returns dictionaries whose keys are the exercise names.
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(prog)

# Calculates training maxes depending on the weight and reps provided but accounting for intensity defined in the progression.
tm = calcTrainingMaxLogs(prog, keyArr, reps, wght)

# Plots lifts individually and uses a cubic spline to interpolate values.
figs = plotData(prog, keyArr, Δdays, tm; xlabel = "Days", ylabel = "Weight", lw=3)
display.(figs)

# Calculates training maxes depending on the weight and intensities used in the progression and the reps provided.
updateMaxes(prog, keyArr, reps)

# Same as above but also updates the programme with the new values. Run this a couple of times and see how the training maxes change by running the one above.
updateMaxes!(prog, keyArr, reps)



TUT = SetScheme(
    type = ["Long Rest", "Longer Rest", "Longest Rest", "Optional Forced Reps"],
    sets = [1, 2, 1, 1],
    reps = [12, 14, 10, 5],
    intensity = [
                  9.5, # Intensity, can be percentage based (decimal form) or RPE
                  10,  # based. Percentages are capped at 1, RPE at 10.
                  10,
                  10
                ],
    roundMode = [
                  floor,  # Rounding mode. Defaults to an array of floors of the
                  floor,  # same length as the others (or a scalar if so are the
                  ceil,   # others).
                  ceil
                ],
    rpeMode = true, # If true the progression is RPE based, else it is
                    # percentage based. Defaults to false.
)

TheGrind = Progression(;
    type = LinearProgression(),
    name = "We Be Grindin'",
    sessions = 1,
    period = 1,
    setScheme = TUT,
)



BenchAccessory = Exercise(;
           name = "Swiss Bar Bench",
           modality = ["Block" , "Semi-Supinated"],
           equipment = "Swiss Bar",
           size = "1 inch",
           muscles = ["Pecs", "Triceps", "Front Delts"],
           trainingMax = 100,
           roundBase = 2.5,
           roundMode = floor,
       )
