using Lifting
using Test
cd(@__DIR__)

SampleExercise = Exercise(;
    name = "Swiss Bar Bench",
    modality = ["Block", "Semi-Supinated"],
    equipment = "Swiss Bar",
    size = "1 inch",
    muscles = ["Pecs", "Triceps", "Front Delts"],
    trainingMax = 100,
    roundBase = 2.5,
    roundMode = floor,
)
SampleExercise2 = Exercise(;
    name = "Squat",
    modality = "Pause",
    trainingMax = 130,
    roundBase = 2.5,
    roundMode = floor,
)
SampleScheme = SetScheme(;
    type = ["Long Rest", "Longer Rest", "Longest Rest"],
    sets = [1, 2, 1],
    reps = [12, 14, 10],
    intensity = [7, 8.5, 9.5],
    roundMode = [floor, floor, ceil],
    rpeMode = true,
)
SampleScheme2 = SetScheme(;
    type = ["Long Rest", "Longer Rest", "Longest Rest"],
    sets = [1, 2, 1],
    reps = [12, 14, 10],
    intensity = [7, 8.5, 9.5],
    roundMode = [floor, floor, ceil],
    rpeMode = true,
)
SampleScheme3 = SetScheme(;
    type = "Long Rest",
    sets = 1,
    reps = 12,
    intensity = 7,
    rpeMode = true,
)
SampleProgression = Progression(;
    type = LinearProgression(),
    name = "Progression Name",
    setScheme = SampleScheme,
)
SampleProgression2 = Progression(;
    type = LinearProgression(),
    name = "Progression Name",
    sessions = 1,
    period = 2,
    setScheme = [deepcopy(SampleScheme), SampleScheme2],
)
SampleProgression3 = Progression(;
    type = LinearProgression(),
    name = "Progression Name",
    setScheme = SampleScheme3,
)
struct SampleProgramme <: AbstractProgramme end
exerProg = Dict()
push!(
    exerProg,
    "SampleExercise" =>
        (exercise = SampleExercise, progression = SampleProgression),
)
push!(
    exerProg,
    "SampleExercise2" =>
        (exercise = SampleExercise2, progression = SampleProgression2),
)
push!(
    exerProg,
    "SampleExercise3" =>
        (exercise = SampleExercise2, progression = SampleProgression3),
)

import Lifting: makeDays
function makeDays(::SampleProgramme, exerProg::Dict)
    week = [[], [], [], [], [], [], []]
    SampleExercise = exerProg["SampleExercise"].exercise
    SampleProgression = exerProg["SampleExercise"].progression

    SampleExercise2 = exerProg["SampleExercise2"].exercise
    SampleProgression2 = exerProg["SampleExercise2"].progression

    SampleExercise3 = exerProg["SampleExercise3"].exercise
    SampleProgression3 = exerProg["SampleExercise3"].progression

    push!(week[1], SampleExercise, SampleProgression)   # Day 1
    push!(week[1], SampleExercise, SampleProgression)   # Day 1
    insert!(week[1], 1, SampleExercise2, SampleProgression2)   # Day 1
    insert!(week[1], 3, SampleExercise3, SampleProgression3)   # Day 1
    push!(week[2], "Rest")  # Day 2
    push!(week[3], SampleExercise, SampleProgression)   # Day 3
    push!(week[4], "Rest")  # Day 4
    push!(week[5], SampleExercise3, SampleProgression3)   # Day 5
    push!(week[5], "Rest")  # Day 6
    push!(week[7], "Rest")  # Day 7
    return week
end

week = makeDays(SampleProgramme(), exerProg)
sampleProgramme =
    Programme(SampleProgramme(), "sampleProgramme", exerProg, week)

@test println(sampleProgramme[1]) === println(sampleProgramme, 1)
@test println(sampleProgramme) === println(sampleProgramme, 1:7)
@test println(sampleProgramme[1:3]) === println(sampleProgramme, 1:7)
@test println(sampleProgramme[1,3,5]) === println(sampleProgramme, 1:7)

write("sampleProgramme.csv", sampleProgramme; log = false)
rm("sampleProgramme.csv")
@test true

write("sampleProgramme.csv", sampleProgramme, 3; log = false)
rm("sampleProgramme.csv")
@test true

write("sampleProgramme.csv", sampleProgramme, 1:2:6; log = false)
rm("sampleProgramme.csv")
@test true

write("sampleProgramme.csv", sampleProgramme; log = true)
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(sampleProgramme)
@test keyArr[1] == "SampleExercise"
@test keyArr[2] == "SampleExercise2"
@test length(keyArr) == length(date) == length(day1) == length(Δdays) == length(reps) == length(wght) == length(rpe)
rm("Log_sampleProgramme.csv")

week = makeDays(SampleProgramme(), exerProg)
sampleProgramme =
    Programme(SampleProgramme(), "sampleProgrammeP", exerProg, week)
keyArr, date, day1, Δdays, reps, wght, rpe = loadLogFile(sampleProgramme)
tm, change = calcTrainingMaxLogs(sampleProgramme, keyArr, reps, wght)
@test length(tm) == 2

figs = plotData(
    sampleProgramme,
    keyArr,
    Δdays,
    tm;
    xlabel = "Days",
    ylabel = "Weight",
    lw = 3,
)
for (i, fig) in enumerate(figs)
    scatterData!(
        fig,
        sampleProgramme,
        keyArr[i],
        Δdays,
        tm;
        shape = :circle,
        markersize = 5,
        label = "",
    )
end
@test figs[1].n == 2
figs = plotData(
    sampleProgramme,
    keyArr,
    Δdays,
    tm;
    xlabel = "Days",
    ylabel = "Weight",
    lw = 3,
    label = "",
)
for (i, fig) in enumerate(figs)
    scatterData!(
        fig,
        sampleProgramme,
        keyArr[i],
        Δdays,
        tm;
        shape = :circle,
        markersize = 5,
    )
end
@test figs[1].n == 2

figs = scatterData(
    sampleProgramme,
    keyArr,
    Δdays,
    tm;
    xlabel = "Days",
    ylabel = "Weight",
    lw = 3,
)
for (i, fig) in enumerate(figs)
    plotData!(
        fig,
        sampleProgramme,
        keyArr[i],
        Δdays,
        tm;
        shape = :circle,
        markersize = 5,
        label = "",
    )
end
@test figs[1].n == 2
figs = scatterData(
    sampleProgramme,
    keyArr,
    Δdays,
    tm;
    xlabel = "Days",
    ylabel = "Weight",
    lw = 3,
    label = "",
)
for (i, fig) in enumerate(figs)
    plotData!(
        fig,
        sampleProgramme,
        keyArr[i],
        Δdays,
        tm;
        shape = :circle,
        markersize = 5,
    )
end
@test figs[1].n == 2

tm, change = updateMaxes(sampleProgramme, keyArr, reps)
@test tm == [56.32850633965048, 77.22038362825882]
@test change == [-42.5, -52.5]

old1 = sampleProgramme.exerProg["SampleExercise"].exercise.trainingMax
old2 = sampleProgramme.exerProg["SampleExercise2"].exercise.trainingMax

updateMaxes!(sampleProgramme, keyArr, reps)
new1 = sampleProgramme.exerProg["SampleExercise"].exercise.trainingMax
new2 = sampleProgramme.exerProg["SampleExercise2"].exercise.trainingMax
@test new1 == old1 - 42.5
@test new2 == old2 - 52.5

tm, change = adjustMaxes("SampleExercise", exerProg, 13, weight = 100)
@test tm == 110.76583082526619
@test change == 52.5
adjustMaxes!("SampleExercise", exerProg, 13, weight = 100)
@test sampleProgramme.exerProg["SampleExercise"].exercise.trainingMax ==
      new1 + 52.5
@test sampleProgramme.exerProg["SampleExercise2"].exercise.trainingMax == new2

old = sampleProgramme.exerProg["SampleExercise"].exercise.trainingMax
tm, change = adjustMaxes("SampleExercise", exerProg, 10, weight = 92.5)
new = tm
@test tm == 92.5
@test change == 2.5
adjustMaxes!("SampleExercise", exerProg, 10, weight =  92.5)
@test sampleProgramme.exerProg["SampleExercise"].exercise.trainingMax == old + change
