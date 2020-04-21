using Lifting, Revise
include("LiftingDictionaries.jl")
include("LiftingProgressions.jl")

### Main lifts
BenchT1 = Exercise(
    name = bench["flat"],
    equipment = equipment["bb"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 92.5,
)
BenchT2 = Exercise(
    name = bench["cg"],
    equipment = equipment["bb"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 75,
)
DeadliftT1 = Exercise(
    name = deadlift["dl"],
    equipment = equipment["bb"],
    muscles = [
        muscles["hamstrings"],
        muscles["glutes"],
        muscles["spinal erectors"],
        muscles["quads"],
        muscles["traps"],
        muscles["lats"],
        muscles["finger flexors"],
    ],
    trainingMax = 160,
)
DeadliftT2 = Exercise(
    name = deadlift["sumo"],
    equipment = equipment["bb"],
    muscles = [
        muscles["quads"],
        muscles["glutes"],
        muscles["hamstrings"],
        muscles["spinal erectors"],
        muscles["traps"],
        muscles["lats"],
        muscles["finger flexors"],
    ],
    trainingMax = 140,
)
SquatT1 = Exercise(
    name = squat["low"],
    equipment = equipment["bb"],
    muscles = [
        muscles["quads"],
        muscles["glutes"],
        muscles["spinal erectors"],
        muscles["transverse abdominis"],
    ],
    trainingMax = 112.5,
)
SquatT2 = Exercise(
    name = squat["front"],
    equipment = equipment["bb"],
    muscles = [muscles["quads"], muscles["glutes"], muscles["core"]],
    trainingMax = 77.5,
)
RowT1 = Exercise(
    name = row["pendlay"],
    modality = modality["cheat"],
    equipment = equipment["bb"],
    muscles = [
        muscles["lats"],
        muscles["biceps"],
        muscles["rear delts"],
        muscles["rhomboids"],
        muscles["finger flexors"],
    ],
    trainingMax = 125,
)
RowT2 = Exercise(
    name = row["kroc"],
    equipment = equipment["db"],
    muscles = [
        muscles["lats"],
        muscles["biceps"],
        muscles["rear delts"],
        muscles["rhomboids"],
        muscles["finger flexors"],
    ],
    trainingMax = 45,
)
PressT1 = Exercise(
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 57.5,
)
calcWeights.(BenchT1, SetsCAP3BenchT1)
calcWeights.(BenchT2, SetsCAP3BenchT2)
calcWeights.(DeadliftT1, SetsCAP3DeadliftT1)
calcWeights.(DeadliftT2, SetsCAP3DeadliftT2)
calcWeights.(SquatT1, SetsCAP3SquatT1)
calcWeights.(SquatT2, SetsCAP3SquatT2)
calcWeights.(RowT1, SetsCAP3RowT1)
calcWeights.(RowT2, SetsCAP3RowT2)
calcWeights.(PressT1, Sets6DayPressT1)

### Accessories
# Squat accessories.
lunges = Exercise(;
    name = squat["lunge"],
    modality = [modality["walking"], modality["backstep"], modality["dragon"]],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 25,
    )
bulgarianSplit = Exercise(;
    name = squat["bulgarian"],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 25,
)
calfRaise = Exercise(;
    name = squat["calf raise"],
    modality = modality["standing"],
    equipment = equipment["db"],
    muscles = muscles["calves"],
    trainingMax = 25,
)
calcWeights.(lunges, h23_lmh.setScheme)
calcWeights.(bulgarianSplit, h23_lmh.setScheme)
calcWeights.(calfRaise, l23_lmh.setScheme)

# Grip
wristExt = Exercise(;
    name = grip["wrist extension"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
)
wristCurl = Exercise(;
    name = grip["wrist curl"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
)
platePinch = Exercise(;
    name = grip["plate pinch"],
    equipment = equipment["plate"],
    muscles = muscles["hand"],
    trainingMax = 22.5,
)
fingerCurl = Exercise(;
    name = grip["finger curl"],
    equipment = equipment["db"],
    muscles = muscles["finger flexors"],
    trainingMax = 25,
    roundMode = ceil,
)
calcWeights(wristExt, gripAMRAP)
calcWeights(wristCurl, gripAMRAP)
calcWeights(platePinch, gripAMRAP)
calcWeights(fingerCurl, gripAMRAP)

# Pulling
facePull = Exercise(;
    name = pull["face"],
    equipment = equipment["cable"],
    muscles = [muscles["rear delts"], muscles["rhomboids"], muscles["rot cuff"]],
    trainingMax = 30,
)
pullup = Exercise(;
    name = pull["pullup"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["biceps"], muscles["brachialis"]],
    trainingMax = 15,
)
hammerCurl = Exercise(;
    name = pull["hammer"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["brachialis"], muscles["biceps"]],
    trainingMax = 15,
)
zottmanCurl = Exercise(;
    name = pull["zottman"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["biceps"], muscles["brachialis"]],
    trainingMax = 12.5,
)
calcWeights.(facePull, l23_lmh.setScheme)
calcWeights.(pullup, h23_lmh.setScheme)
calcWeights.(hammerCurl, l23_lmh.setScheme)
calcWeights.(zottmanCurl, l23_lmh.setScheme)

# Pushing
inclineDBBench = Exercise(;
    name = bench["incline"],
    equipment = equipment["db"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 45,
)
dips = Exercise(;
    name = bench["dips"],
    equipment = [equipment["parallette"], equipment["chain belt"]],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 15,
)
sideRaise = Exercise(;
    name = press["side raise"],
    equipment = equipment["db"],
    muscles = muscles["side delts"],
    trainingMax = 12.5,
)
calcWeights.(inclineDBBench, m23_lmh.setScheme)
calcWeights.(dips, m23_lmh.setScheme)
calcWeights.(sideRaise, l23_lmh.setScheme)

# Core
dragonFlag = Exercise(;
    name = core["dragon flag"],
    equipment = equipment["none"],
    muscles = muscles["core"],
)
vsit = Exercise(;
    name = core["v sit"],
    equipment = equipment["parallette"],
    muscles = muscles["core"],
)
legRaise = Exercise(;
    name = core["leg raise"],
    equipment = equipment["pullup bar"],
    muscles = muscles["core"],
)
toeToBar = Exercise(;
    name = core["toes to bar"],
    equipment = equipment["pullup bar"],
    muscles = muscles["core"],
)
abRollout =  Exercise(;
    name = core["ab roll"],
    equipment = equipment["ab wheel"],
    muscles = muscles["core"],
)
landMine =  Exercise(;
    name = core["landmine"],
    equipment = equipment["bb"],
    muscles = muscles["core"],
    trainingMax = 40,
)
paraCrunch = Exercise(;
    name = core["parallette crunch"],
    equipment = [equipment["parallette"], equipment["db"]],
    muscles = muscles["core"],
    trainingMax = 15,
)
calcWeights(dragonFlag, calisthenics)
calcWeights(vsit, calisthenics)
calcWeights.(legRaise, m23_lmh.setScheme)
calcWeights(toeToBar, calisthenics)
calcWeights(abRollout, calisthenics)
calcWeights.(landMine, m23_lmh.setScheme)
calcWeights.(paraCrunch, m23_lmh.setScheme)

# Calisthenics Isometrics
frontLever = Exercise(;
    name = isometric["front"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["core"]],
)
backLever = Exercise(;
    name = isometric["back"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["pecs"], muscles["front delts"], muscles["core"]],
)
calcWeights(frontLever, calisthenics)
calcWeights(backLever, calisthenics)
###
week1 = [[],[],[],[],[],[],[]]
week2 = [[],[],[],[],[],[],[]]
week3 = [[],[],[],[],[],[],[]]

# Week1
push!(week1[1], BenchT1, ProgCAP3BenchT1, 1)
push!(week1[1], BenchT2, ProgCAP3BenchT2, 1)
push!(week1[1], wristCurl, ProgGrip)
push!(week1[1], wristExt, ProgGrip)
push!(week1[1], dragonFlag, ProgCali)
push!(week1[1], frontLever, ProgCali)
push!(week1[1], lunges, h23_lmh, 2)
push!(week1[1], facePull, l23_lmh, 2)
push!(week1[1], legRaise, m23_lmh,2)

push!(week1[2], DeadliftT2, ProgCAP3DeadliftT2, 1)
push!(week1[2], RowT2, ProgCAP3RowT2, 1)
push!(week1[2], sideRaise, l23_lmh, 2)
push!(week1[2], hammerCurl, l23_lmh, 2)
push!(week1[2], inclineDBBench, m23_lmh, 3)
push!(week1[2], platePinch, ProgGrip)
push!(week1[2], zottmanCurl, l23_lmh, 2)
push!(week1[2], vsit, ProgCali)

push!(week1[3], SquatT1, ProgCAP3SquatT1, 1)
push!(week1[3], PressT1, Prog6DayPressT1, 1)
push!(week1[3], backLever, ProgCali)
push!(week1[3], pullup, h23_lmh, 2)
push!(week1[3], calfRaise, l23_lmh, 1)
push!(week1[3], fingerCurl, ProgGrip)
push!(week1[3], dips, m23_lmh, 3)
push!(week1[3], abRollout, ProgCali)

push!(week1[4], BenchT1, ProgCAP3BenchT1, 2)
push!(week1[4], BenchT2, ProgCAP3BenchT2, 2)
push!(week1[4], wristCurl, ProgGrip)
push!(week1[4], wristExt, ProgGrip)
push!(week1[4], landMine, m23_lmh, 1)
push!(week1[4], frontLever, ProgCali)
push!(week1[4], bulgarianSplit, h23_lmh, 2)
push!(week1[4], facePull, l23_lmh, 2)
push!(week1[4], toeToBar, ProgCali)

push!(week1[5], "Rest")

push!(week1[6], DeadliftT1, ProgCAP3DeadliftT1, 1)
push!(week1[6], RowT1, ProgCAP3RowT1, 1)
push!(week1[6], sideRaise, l23_lmh, 2)
push!(week1[6], hammerCurl, l23_lmh, 2)
push!(week1[6], inclineDBBench, m23_lmh, 3)
push!(week1[6], platePinch, ProgGrip)
push!(week1[6], zottmanCurl, l23_lmh, 2)
push!(week1[6], vsit, ProgCali)

push!(week1[7], SquatT2, ProgCAP3SquatT2, 1)
push!(week1[7], PressT1, Prog6DayPressT1, 2)
push!(week1[7], backLever, ProgCali)
push!(week1[7], pullup, h23_lmh, 2)
push!(week1[7], calfRaise, l23_lmh, 1)
push!(week1[7], fingerCurl, ProgGrip)
push!(week1[7], dips, m23_lmh, 3)
push!(week1[7], paraCrunch, m23_lmh, 1)

# Week 2
push!(week2[1], BenchT1, ProgCAP3BenchT1, 3)
push!(week2[1], BenchT2, ProgCAP3BenchT2, 3)
push!(week2[1], wristCurl, ProgGrip)
push!(week2[1], wristExt, ProgGrip)
push!(week2[1], dragonFlag, ProgCali)
push!(week2[1], frontLever, ProgCali)
push!(week2[1], lunges, h23_lmh, 1)
push!(week2[1], facePull, l23_lmh, 3)
push!(week2[1], legRaise, m23_lmh, 3)

push!(week2[2], DeadliftT2, ProgCAP3DeadliftT2, 2)
push!(week2[2], RowT2, ProgCAP3RowT2, 2)
push!(week2[2], sideRaise, l23_lmh, 3)
push!(week2[2], hammerCurl, l23_lmh, 3)
push!(week2[2], inclineDBBench, m23_lmh, 1)
push!(week2[2], platePinch, ProgGrip)
push!(week2[2], zottmanCurl, l23_lmh, 3)
push!(week2[2], vsit, ProgCali)

push!(week2[3], "Rest")

push!(week2[4], SquatT1, ProgCAP3SquatT1, 2)
push!(week2[4], PressT1, Prog6DayPressT1, 1)
push!(week2[4], backLever, ProgCali)
push!(week2[4], pullup, h23_lmh, 3)
push!(week2[4], calfRaise, l23_lmh, 2)
push!(week2[4], fingerCurl, ProgGrip)
push!(week2[4], dips, m23_lmh, 1)
push!(week2[4], abRollout, ProgCali)

push!(week2[5], BenchT1, ProgCAP3BenchT1, 4)
push!(week2[5], BenchT2, ProgCAP3BenchT2, 4)
push!(week2[5], wristCurl, ProgGrip)
push!(week2[5], wristExt, ProgGrip)
push!(week2[5], landMine, m23_lmh, 3)
push!(week2[5], frontLever, ProgCali)
push!(week2[5], bulgarianSplit, h23_lmh, 1)
push!(week2[5], facePull, l23_lmh, 3)
push!(week2[5], toeToBar, ProgCali)

push!(week2[6], DeadliftT1, ProgCAP3DeadliftT1, 2)
push!(week2[6], RowT1, ProgCAP3RowT1, 2)
push!(week2[6], sideRaise, l23_lmh, 2)
push!(week2[6], hammerCurl, l23_lmh, 2)
push!(week2[6], inclineDBBench, m23_lmh, 3)
push!(week2[6], platePinch, ProgGrip)
push!(week2[6], zottmanCurl, l23_lmh, 2)
push!(week2[6], vsit, ProgCali)

push!(week2[7], SquatT2, ProgCAP3SquatT2, 1)
push!(week2[7], PressT1, Prog6DayPressT1, 2)
push!(week2[7], backLever, ProgCali)
push!(week2[7], pullup, h23_lmh, 2)
push!(week2[7], calfRaise, l23_lmh, 1)
push!(week2[7], fingerCurl, ProgGrip)
push!(week2[7], dips, m23_lmh, 3)
push!(week2[7], paraCrunch, m23_lmh, 3)

# Week3
push!(week3[1], "Rest")

push!(week3[2], BenchT1, ProgCAP3BenchT1, 5)
push!(week3[2], BenchT2, ProgCAP3BenchT2, 5)
push!(week3[2], wristCurl, ProgGrip)
push!(week3[2], wristExt, ProgGrip)
push!(week3[2], dragonFlag, ProgCali)
push!(week3[2], frontLever, ProgCali)
push!(week3[2], lunges, h23_lmh, 3)
push!(week3[2], facePull, l23_lmh, 1)
push!(week3[2], legRaise, m23_lmh, 1)

push!(week3[3], DeadliftT2, ProgCAP3DeadliftT2, 3)
push!(week3[3], RowT2, ProgCAP3RowT2, 3)
push!(week3[3], sideRaise, l23_lmh, 1)
push!(week3[3], hammerCurl, l23_lmh, 1)
push!(week3[3], inclineDBBench, m23_lmh, 2)
push!(week3[3], platePinch, ProgGrip)
push!(week3[3], zottmanCurl, l23_lmh, 1)
push!(week3[3], vsit, ProgCali)

push!(week3[4], SquatT1, ProgCAP3SquatT1, 3)
push!(week3[4], PressT1, Prog6DayPressT1, 1)
push!(week3[4], backLever, ProgCali)
push!(week3[4], pullup, h23_lmh, 1)
push!(week3[4], calfRaise, l23_lmh, 3)
push!(week3[4], fingerCurl, ProgGrip)
push!(week3[4], dips, m23_lmh, 2)
push!(week3[4], abRollout, ProgCali)

push!(week3[5], BenchT1, ProgCAP3BenchT1, 6)
push!(week3[5], BenchT2, ProgCAP3BenchT2, 6)
push!(week3[5], wristCurl, ProgGrip)
push!(week3[5], wristExt, ProgGrip)
push!(week3[5], landMine, m23_lmh, 2)
push!(week3[5], frontLever, ProgCali)
push!(week3[5], bulgarianSplit, h23_lmh, 2)
push!(week3[5], facePull, l23_lmh, 1)
push!(week3[5], toeToBar, ProgCali)

push!(week3[6], DeadliftT1, ProgCAP3DeadliftT1, 3)
push!(week3[6], RowT1, ProgCAP3RowT1, 3)
push!(week3[6], sideRaise, l23_lmh, 1)
push!(week3[6], hammerCurl, l23_lmh, 1)
push!(week3[6], inclineDBBench, m23_lmh, 2)
push!(week3[6], platePinch, ProgGrip)
push!(week3[6], zottmanCurl, l23_lmh, 1)
push!(week3[6], vsit, ProgCali)

push!(week3[7], SquatT2, ProgCAP3SquatT2, 1)
push!(week3[7], PressT1, Prog6DayPressT1, 2)
push!(week3[7], backLever, ProgCali)
push!(week3[7], pullup, h23_lmh, 1)
push!(week3[7], calfRaise, l23_lmh, 3)
push!(week3[7], fingerCurl, ProgGrip)
push!(week3[7], dips, m23_lmh, 2)
push!(week3[7], paraCrunch, m23_lmh, 2)

programmes = Dict{String, Programme}()
push!(
    programmes,
    "current" => Programme(
        "nSuns CAP3-LP Hybrid",
        [BenchT1, BenchT2, DeadliftT2, SquatT1, DeadliftT1, SquatT2],
        [
            ProgCAP3BenchT1,
            ProgCAP3BenchT2,
            ProgCAP3DeadliftT2,
            ProgCAP3SquatT1,
            ProgCAP3DeadliftT1,
            ProgCAP3SquatT2,
        ],
        [
            week1[1], week1[2], week1[3], week1[4], week1[5][1], week1[6], week1[7],
            week2[1], week2[2], week2[3][1], week2[4], week2[5], week2[6], week2[7],
            week3[1][1], week3[2], week3[3], week3[4], week3[5], "Rest", week3[6], week3[7],
        ],
    ),
)
test = (1, 2, 3)
u = [test[i] for i in 1:3]
showDays(programmes["current"])

type = programmes["current"].days[1][1].type
set = programmes["current"].days[1][1].sets
reps = programmes["current"].days[1][1].reps
wght = programmes["current"].days[1][1].wght
rpe = programmes["current"].days[1][1].rpe

println(type[1])
println(set[1], " × ", reps[1], " × ", wght[1], "\t(rpe: ", rpe[1], ")")
println(set[2], " × ", reps[2], " × ", wght[2], "\t(rpe: ", rpe[2], ")")
