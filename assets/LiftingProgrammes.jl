using Lifting
using Revise
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
    trainingMax = 162.5,
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
    trainingMax = 115,
)
SquatT2 = Exercise(
    name = squat["front"],
    equipment = equipment["bb"],
    muscles = [muscles["quads"], muscles["glutes"], muscles["core"]],
    trainingMax = 80,
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
    trainingMax = 132.5,
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
    trainingMax = 42.5,
)
PressT1 = Exercise(
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 60,
)

### Accessories
# Squat accessories.
lunges = Exercise(;
    name = squat["lunge"],
    modality = [modality["walking"], modality["backstep"], modality["dragon"]],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 47.5,
)
bulgarianSplit = Exercise(;
    name = squat["bulgarian"],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 37.5,
)
calfRaise = Exercise(;
    name = squat["calf raise"],
    modality = modality["standing"],
    equipment = equipment["db"],
    muscles = muscles["calves"],
    trainingMax = 20,
)
ProgLunges = deepcopy(h23_lmh)
ProgBulg = deepcopy(h23_lmh)
ProgCalfRaise = deepcopy(l23_lmh)
calcWeights(lunges, ProgLunges)

# Grip
wristExt = Exercise(;
    name = grip["wrist extension"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
    roundBase = 1,
)
wristCurl = Exercise(;
    name = grip["wrist curl"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
    roundBase = 1,
)
platePinch = Exercise(;
    name = grip["plate pinch"],
    equipment = equipment["plate"],
    muscles = muscles["hand"],
    trainingMax = 27.5,
)
fingerCurl = Exercise(;
    name = grip["finger curl"],
    equipment = equipment["db"],
    muscles = muscles["finger flexors"],
    trainingMax = 20,
)
ProgWristExt = deepcopy(ProgGrip)
ProgWristCurl = deepcopy(ProgGrip)
ProgPlatePinch = deepcopy(ProgGrip)
ProgFingerCurl = deepcopy(ProgGrip)

# Pulling
facePull = Exercise(;
    name = pull["face"],
    equipment = equipment["cable"],
    muscles = [
        muscles["rear delts"],
        muscles["rhomboids"],
        muscles["rot cuff"],
    ],
    trainingMax = 30,
)
pullup = Exercise(;
    name = pull["pullup"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["biceps"], muscles["brachialis"]],
    trainingMax = 12.5,
    roundBase = 1.25,
)
hammerCurl = Exercise(;
    name = pull["hammer"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["brachialis"], muscles["biceps"]],
    trainingMax = 20,
)
zottmanCurl = Exercise(;
    name = pull["zottman"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["biceps"], muscles["brachialis"]],
    trainingMax = 12.5,
)
ProgFacePull = deepcopy(l23_lmh)
ProgPullup = deepcopy(h23_lmh)
ProgHammerCurl = deepcopy(l23_lmh)
ProgZottmanCurl = deepcopy(l23_lmh)

# Pushing
inclineDBBench = Exercise(;
    name = bench["db incline"],
    equipment = equipment["db"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 45,
)
dips = Exercise(;
    name = bench["dips"],
    equipment = [equipment["parallette"], equipment["chain belt"]],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 12.5,
    roundBase = 1.25,
)
sideRaise = Exercise(;
    name = press["side raise"],
    equipment = equipment["db"],
    muscles = muscles["side delts"],
    trainingMax = 12.5,
)
ProgInclineDBBench = deepcopy(m23_lmh)
ProgDips = deepcopy(m23_lmh)
ProgSideRaise = deepcopy(l23_lmh)

# Core
dragonFlag = Exercise(;
    name = core["dragon flag"],
    equipment = equipment["none"],
    muscles = muscles["core"],
    trainingMax = 10,
)
vsit = Exercise(;
    name = core["v sit"],
    equipment = equipment["parallette"],
    muscles = muscles["core"],
    trainingMax = 10,
)
legRaise = Exercise(;
    name = core["leg raise"],
    equipment = equipment["pullup bar"],
    muscles = muscles["core"],
    trainingMax = 12.5,
)
toeToBar = Exercise(;
    name = core["toes to bar"],
    equipment = equipment["pullup bar"],
    muscles = muscles["core"],
    trainingMax = 10,
)
abRollout = Exercise(;
    name = core["ab roll"],
    modality = modality["kneeling"],
    equipment = equipment["ab wheel"],
    muscles = muscles["core"],
    trainingMax = 10,
)
landMine = Exercise(;
    name = core["landmine"],
    equipment = equipment["bb"],
    muscles = muscles["core"],
    trainingMax = 50,
)
paraCrunch = Exercise(;
    name = core["parallette crunch"],
    equipment = [equipment["parallette"], equipment["db"]],
    muscles = muscles["core"],
    trainingMax = 15,
)
ProgDragonFlag = deepcopy(ProgCali)
ProgVsit = deepcopy(ProgCali)
ProgLegRaise = deepcopy(m23_lmh)
ProgToeToBar = deepcopy(ProgCali)
ProgAbRollout = deepcopy(ProgCali)
ProgLandMine = deepcopy(m23_lmh)
ProgParaCrunch = deepcopy(m23_lmh)

# Calisthenics Isometrics
frontLever = Exercise(;
    name = isometric["front"],
    modality = modality["one leg out"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["core"]],
    trainingMax = 15,
)
backLever = Exercise(;
    name = isometric["back"],
    modality = modality["straddle"],
    equipment = equipment["pullup bar"],
    muscles = [
        muscles["lats"],
        muscles["pecs"],
        muscles["front delts"],
        muscles["core"],
    ],
    trainingMax = 15,
)
ProgFrontLever = deepcopy(ProgCali)
ProgBackLever = deepcopy(ProgCali)

###
week1 = [[], [], [], [], [], [], []]
week2 = [[], [], [], [], [], [], []]
week3 = [[], [], [], [], [], [], []]
# Week1
push!(week1[1], BenchT1, ProgCAP3BenchT1, 1)
push!(week1[1], BenchT2, ProgCAP3BenchT2, 1)
push!(week1[1], wristCurl, ProgWristCurl)
push!(week1[1], wristExt, ProgWristExt)
push!(week1[1], dragonFlag, ProgDragonFlag)
push!(week1[1], frontLever, ProgFrontLever)
push!(week1[1], lunges, ProgLunges, 2)
push!(week1[1], facePull, ProgFacePull, 2)
push!(week1[1], legRaise, ProgLegRaise, 2)

push!(week1[2], DeadliftT2, ProgCAP3DeadliftT2, 1)
push!(week1[2], RowT2, ProgCAP3RowT2, 1)
push!(week1[2], sideRaise, ProgSideRaise, 2)
push!(week1[2], hammerCurl, ProgHammerCurl, 2)
push!(week1[2], inclineDBBench, ProgInclineDBBench, 3)
push!(week1[2], platePinch, ProgPlatePinch)
push!(week1[2], zottmanCurl, ProgZottmanCurl, 2)
push!(week1[2], vsit, ProgVsit)

push!(week1[3], SquatT1, ProgCAP3SquatT1, 1)
push!(week1[3], PressT1, Prog6DayPressT1, 1)
push!(week1[3], backLever, ProgBackLever)
push!(week1[3], pullup, ProgPullup, 2)
push!(week1[3], calfRaise, ProgCalfRaise, 1)
push!(week1[3], fingerCurl, ProgFingerCurl)
push!(week1[3], dips, ProgDips, 3)
push!(week1[3], abRollout, ProgAbRollout)

push!(week1[4], BenchT1, ProgCAP3BenchT1, 2)
push!(week1[4], BenchT2, ProgCAP3BenchT2, 2)
push!(week1[4], wristCurl, ProgWristCurl)
push!(week1[4], wristExt, ProgWristExt)
push!(week1[4], landMine, ProgLandMine, 1)
push!(week1[4], frontLever, ProgFrontLever)
push!(week1[4], bulgarianSplit, ProgBulg, 2)
push!(week1[4], facePull, ProgFacePull, 2)
push!(week1[4], toeToBar, ProgToeToBar)

push!(week1[5], DeadliftT1, ProgCAP3DeadliftT1, 1)
push!(week1[5], RowT1, ProgCAP3RowT1, 1)
push!(week1[5], sideRaise, ProgSideRaise, 2)
push!(week1[5], hammerCurl, ProgHammerCurl, 2)
push!(week1[5], inclineDBBench, ProgInclineDBBench, 3)
push!(week1[5], platePinch, ProgPlatePinch)
push!(week1[5], zottmanCurl, ProgZottmanCurl, 2)
push!(week1[5], vsit, ProgVsit)

push!(week1[6], SquatT2, ProgCAP3SquatT2, 1)
push!(week1[6], PressT1, Prog6DayPressT1, 2)
push!(week1[6], backLever, ProgBackLever)
push!(week1[6], pullup, ProgPullup, 2)
push!(week1[6], calfRaise, ProgCalfRaise, 1)
push!(week1[6], fingerCurl, ProgFingerCurl)
push!(week1[6], dips, ProgDips, 3)
push!(week1[6], paraCrunch, ProgParaCrunch, 1)

# Week 2
push!(week2[1], BenchT1, ProgCAP3BenchT1, 3)
push!(week2[1], BenchT2, ProgCAP3BenchT2, 3)
push!(week2[1], wristCurl, ProgWristCurl)
push!(week2[1], wristExt, ProgWristExt)
push!(week2[1], dragonFlag, ProgDragonFlag)
push!(week2[1], frontLever, ProgFrontLever)
push!(week2[1], lunges, ProgLunges, 1)
push!(week2[1], facePull, ProgFacePull, 3)
push!(week2[1], legRaise, ProgLegRaise, 3)

push!(week2[2], DeadliftT2, ProgCAP3DeadliftT2, 2)
push!(week2[2], RowT2, ProgCAP3RowT2, 2)
push!(week2[2], sideRaise, ProgSideRaise, 3)
push!(week2[2], hammerCurl, ProgHammerCurl, 3)
push!(week2[2], inclineDBBench, ProgInclineDBBench, 1)
push!(week2[2], platePinch, ProgPlatePinch)
push!(week2[2], zottmanCurl, ProgZottmanCurl, 3)
push!(week2[2], vsit, ProgVsit)

push!(week2[3], SquatT1, ProgCAP3SquatT1, 2)
push!(week2[3], PressT1, Prog6DayPressT1, 1)
push!(week2[3], backLever, ProgBackLever)
push!(week2[3], pullup, ProgPullup, 3)
push!(week2[3], calfRaise, ProgCalfRaise, 2)
push!(week2[3], fingerCurl, ProgFingerCurl)
push!(week2[3], dips, ProgDips, 1)
push!(week2[3], abRollout, ProgAbRollout)

push!(week2[4], BenchT1, ProgCAP3BenchT1, 4)
push!(week2[4], BenchT2, ProgCAP3BenchT2, 4)
push!(week2[4], wristCurl, ProgWristCurl)
push!(week2[4], wristExt, ProgWristExt)
push!(week2[4], landMine, ProgLandMine, 3)
push!(week2[4], frontLever, ProgFrontLever)
push!(week2[4], bulgarianSplit, ProgBulg, 1)
push!(week2[4], facePull, ProgFacePull, 3)
push!(week2[4], toeToBar, ProgToeToBar)

push!(week2[5], DeadliftT1, ProgCAP3DeadliftT1, 2)
push!(week2[5], RowT1, ProgCAP3RowT1, 2)
push!(week2[5], sideRaise, ProgSideRaise, 2)
push!(week2[5], hammerCurl, ProgHammerCurl, 2)
push!(week2[5], inclineDBBench, ProgInclineDBBench, 3)
push!(week2[5], platePinch, ProgPlatePinch)
push!(week2[5], zottmanCurl, ProgZottmanCurl, 2)
push!(week2[5], vsit, ProgVsit)

push!(week2[6], SquatT2, ProgCAP3SquatT2, 1)
push!(week2[6], PressT1, Prog6DayPressT1, 2)
push!(week2[6], backLever, ProgBackLever)
push!(week2[6], pullup, ProgPullup, 2)
push!(week2[6], calfRaise, ProgCalfRaise, 1)
push!(week2[6], fingerCurl, ProgFingerCurl)
push!(week2[6], dips, ProgDips, 3)
push!(week2[6], paraCrunch, ProgParaCrunch, 3)

# Week3
push!(week3[1], BenchT1, ProgCAP3BenchT1, 5)
push!(week3[1], BenchT2, ProgCAP3BenchT2, 5)
push!(week3[1], wristCurl, ProgWristCurl)
push!(week3[1], wristExt, ProgWristExt)
push!(week3[1], dragonFlag, ProgDragonFlag)
push!(week3[1], frontLever, ProgFrontLever)
push!(week3[1], lunges, ProgLunges, 3)
push!(week3[1], facePull, ProgFacePull, 1)
push!(week3[1], legRaise, ProgLegRaise, 1)

push!(week3[2], DeadliftT2, ProgCAP3DeadliftT2, 3)
push!(week3[2], RowT2, ProgCAP3RowT2, 3)
push!(week3[2], sideRaise, ProgSideRaise, 1)
push!(week3[2], hammerCurl, ProgHammerCurl, 1)
push!(week3[2], inclineDBBench, ProgInclineDBBench, 2)
push!(week3[2], platePinch, ProgPlatePinch)
push!(week3[2], zottmanCurl, ProgZottmanCurl, 1)
push!(week3[2], vsit, ProgVsit)

push!(week3[3], SquatT1, ProgCAP3SquatT1, 3)
push!(week3[3], PressT1, Prog6DayPressT1, 1)
push!(week3[3], backLever, ProgBackLever)
push!(week3[3], pullup, ProgPullup, 1)
push!(week3[3], calfRaise, ProgCalfRaise, 3)
push!(week3[3], fingerCurl, ProgFingerCurl)
push!(week3[3], dips, ProgDips, 2)
push!(week3[3], abRollout, ProgAbRollout)

push!(week3[4], BenchT1, ProgCAP3BenchT1, 6)
push!(week3[4], BenchT2, ProgCAP3BenchT2, 6)
push!(week3[4], wristCurl, ProgWristCurl)
push!(week3[4], wristExt, ProgWristExt)
push!(week3[4], landMine, ProgLandMine, 2)
push!(week3[4], frontLever, ProgFrontLever)
push!(week3[4], bulgarianSplit, ProgBulg, 2)
push!(week3[4], facePull, ProgFacePull, 1)
push!(week3[4], toeToBar, ProgToeToBar)

push!(week3[5], DeadliftT1, ProgCAP3DeadliftT1, 3)
push!(week3[5], RowT1, ProgCAP3RowT1, 3)
push!(week3[5], sideRaise, ProgSideRaise, 1)
push!(week3[5], hammerCurl, ProgHammerCurl, 1)
push!(week3[5], inclineDBBench, ProgInclineDBBench, 2)
push!(week3[5], platePinch, ProgPlatePinch)
push!(week3[5], zottmanCurl, ProgZottmanCurl, 1)
push!(week3[5], vsit, ProgVsit)

push!(week3[6], SquatT2, ProgCAP3SquatT2, 1)
push!(week3[6], PressT1, Prog6DayPressT1, 2)
push!(week3[6], backLever, ProgBackLever)
push!(week3[6], pullup, ProgPullup, 1)
push!(week3[6], calfRaise, ProgCalfRaise, 3)
push!(week3[6], fingerCurl, ProgFingerCurl)
push!(week3[6], dips, ProgDips, 2)
push!(week3[6], paraCrunch, ProgParaCrunch, 2)

programmes = Dict{String, Programme}()
push!(
    programmes,
    "current" => Programme(
        "nSuns CAP3-LP Hybrid",
        [
            week1[1],
            week1[2],
            week1[3],
            week1[4],
            "Rest",
            week1[5],
            week1[6],
            week2[1],
            week2[2],
            "Rest",
            week2[3],
            week2[4],
            week2[5],
            week2[6],
            "Rest",
            week3[1],
            week3[2],
            week3[3],
            week3[4],
            "Rest",
            week3[5],
            week3[6],
            "Rest",
        ],
    ),
)

display(programmes["current"])
write(programmes["current"].name*".csv", programmes["current"])
