struct nSunsCAP3_OHP_6Day_LP <: AbstractProgramme end
typeProgramme = nSunsCAP3_OHP_6Day_LP()
nameProgramme = "nSunsCAP3_OHP_6Day_LP"
exerProg = Dict()
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
push!(
    exerProg,
    "BenchT1" => (exercise = BenchT1, progression = CAP3_Bench_T1),
)
push!(
    exerProg,
    "BenchT2" => (exercise = BenchT2, progression = CAP3_Bench_T2),
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
push!(
    exerProg,
    "DeadliftT1" => (exercise = DeadliftT1, progression = CAP3_Deadlift_T1),
)
push!(
    exerProg,
    "DeadliftT2" => (exercise = DeadliftT2, progression = CAP3_Deadlift_T2),
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
push!(
    exerProg,
    "SquatT1" => (exercise = SquatT1, progression = CAP3_Squat_T1),
)
push!(
    exerProg,
    "SquatT2" => (exercise = SquatT2, progression = CAP3_Squat_T2),
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
push!(exerProg, "RowT1" => (exercise = RowT1, progression = CAP3_Row_T1))
push!(exerProg, "RowT2" => (exercise = RowT2, progression = CAP3_Row_T2))

PressT1 = Exercise(
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 60,
)
push!(
    exerProg,
    "PressT1" => (exercise = PressT1, progression = nSuns_6Day_OHP),
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
push!(exerProg, "lunges" => (exercise = lunges, progression = ProgLunges))
push!(
    exerProg,
    "bulgarianSplit" => (exercise = bulgarianSplit, progression = ProgBulg),
)
push!(
    exerProg,
    "calfRaise" => (exercise = calfRaise, progression = ProgCalfRaise),
)

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
ProgWristExt = deepcopy(AMRAP_Grip)
ProgWristCurl = deepcopy(AMRAP_Grip)
ProgPlatePinch = deepcopy(AMRAP_Grip)
ProgFingerCurl = deepcopy(AMRAP_Grip)
push!(exerProg, "wristExt" => (exercise = wristExt, progression = ProgWristExt))
push!(
    exerProg,
    "wristCurl" => (exercise = wristCurl, progression = ProgWristCurl),
)
push!(
    exerProg,
    "platePinch" => (exercise = platePinch, progression = ProgPlatePinch),
)
push!(
    exerProg,
    "fingerCurl" => (exercise = fingerCurl, progression = ProgFingerCurl),
)

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
push!(exerProg, "facePull" => (exercise = facePull, progression = ProgFacePull))
push!(exerProg, "pullup" => (exercise = pullup, progression = ProgPullup))
push!(
    exerProg,
    "hammerCurl" => (exercise = hammerCurl, progression = ProgHammerCurl),
)
push!(
    exerProg,
    "zottmanCurl" => (exercise = zottmanCurl, progression = ProgZottmanCurl),
)

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
push!(
    exerProg,
    "inclineDBBench" =>
        (exercise = inclineDBBench, progression = ProgInclineDBBench),
)
push!(exerProg, "dips" => (exercise = dips, progression = ProgDips))
push!(
    exerProg,
    "sideRaise" => (exercise = sideRaise, progression = ProgSideRaise),
)

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
ProgDragonFlag = deepcopy(AMRAP_Cali)
ProgVsit = deepcopy(AMRAP_Cali)
ProgLegRaise = deepcopy(m23_lmh)
ProgToeToBar = deepcopy(AMRAP_Cali)
ProgAbRollout = deepcopy(AMRAP_Cali)
ProgLandMine = deepcopy(m23_lmh)
ProgParaCrunch = deepcopy(m23_lmh)
push!(
    exerProg,
    "dragonFlag" => (exercise = dragonFlag, progression = ProgDragonFlag),
)
push!(exerProg, "vsit" => (exercise = vsit, progression = ProgVsit))
push!(exerProg, "legRaise" => (exercise = legRaise, progression = ProgLegRaise))
push!(exerProg, "toeToBar" => (exercise = toeToBar, progression = ProgToeToBar))
push!(
    exerProg,
    "abRollout" => (exercise = abRollout, progression = ProgAbRollout),
)
push!(exerProg, "landMine" => (exercise = landMine, progression = ProgLandMine))
push!(
    exerProg,
    "paraCrunch" => (exercise = paraCrunch, progression = ProgParaCrunch),
)

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
ProgFrontLever = deepcopy(AMRAP_Cali)
ProgBackLever = deepcopy(AMRAP_Cali)
push!(
    exerProg,
    "frontLever" => (exercise = frontLever, progression = ProgFrontLever),
)
push!(
    exerProg,
    "backLever" => (exercise = backLever, progression = ProgBackLever),
)

###
import Lifting: makeDays
function makeDays(::nSunsCAP3_OHP_6Day_LP, dict::Dict)
    week1 = [[], [], [], [], [], [], []]
    week2 = [[], [], [], [], [], [], []]
    week3 = [[], [], [], [], [], [], []]

    push!(week1[1], dict["BenchT1"][1], dict["BenchT1"][2], 1)
    push!(week1[1], dict["BenchT2"][1], dict["BenchT2"][2], 1)
    push!(week1[1], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week1[1], dict["wristExt"][1], dict["wristExt"][2])
    push!(week1[1], dict["dragonFlag"][1], dict["dragonFlag"][2])
    push!(week1[1], dict["frontLever"][1], dict["frontLever"][2])
    push!(week1[1], dict["lunges"][1], dict["lunges"][2], 2)
    push!(week1[1], dict["facePull"][1], dict["facePull"][2], 2)
    push!(week1[1], dict["legRaise"][1], dict["legRaise"][2], 2)

    push!(week1[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 1)
    push!(week1[2], dict["RowT2"][1], dict["RowT2"][2], 1)
    push!(week1[2], dict["sideRaise"][1], dict["sideRaise"][2], 2)
    push!(week1[2], dict["hammerCurl"][1], dict["hammerCurl"][2], 2)
    push!(week1[2], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 3)
    push!(week1[2], dict["platePinch"][1], dict["platePinch"][2])
    push!(week1[2], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 2)
    push!(week1[2], dict["vsit"][1], dict["vsit"][2])

    push!(week1[3], dict["SquatT1"][1], dict["SquatT1"][2], 1)
    push!(week1[3], dict["PressT1"][1], dict["PressT1"][2], 1)
    push!(week1[3], dict["backLever"][1], dict["backLever"][2])
    push!(week1[3], dict["pullup"][1], dict["pullup"][2], 2)
    push!(week1[3], dict["calfRaise"][1], dict["calfRaise"][2], 1)
    push!(week1[3], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week1[3], dict["dips"][1], dict["dips"][2], 3)
    push!(week1[3], dict["abRollout"][1], dict["abRollout"][2])

    push!(week1[4], dict["BenchT1"][1], dict["BenchT1"][2], 2)
    push!(week1[4], dict["BenchT2"][1], dict["BenchT2"][2], 2)
    push!(week1[4], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week1[4], dict["wristExt"][1], dict["wristExt"][2])
    push!(week1[4], dict["landMine"][1], dict["landMine"][2], 1)
    push!(week1[4], dict["frontLever"][1], dict["frontLever"][2])
    push!(week1[4], dict["bulgarianSplit"][1], dict["bulgarianSplit"][2], 3)
    push!(week1[4], dict["facePull"][1], dict["facePull"][2], 2)
    push!(week1[4], dict["toeToBar"][1], dict["toeToBar"][2])

    push!(week1[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 1)
    push!(week1[5], dict["RowT1"][1], dict["RowT1"][2], 1)
    push!(week1[5], dict["sideRaise"][1], dict["sideRaise"][2], 2)
    push!(week1[5], dict["hammerCurl"][1], dict["hammerCurl"][2], 2)
    push!(week1[5], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 3)
    push!(week1[5], dict["platePinch"][1], dict["platePinch"][2])
    push!(week1[5], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 2)
    push!(week1[5], dict["vsit"][1], dict["vsit"][2])

    push!(week1[6], dict["SquatT2"][1], dict["SquatT2"][2], 1)
    push!(week1[6], dict["PressT1"][1], dict["PressT1"][2], 2)
    push!(week1[6], dict["backLever"][1], dict["backLever"][2])
    push!(week1[6], dict["pullup"][1], dict["pullup"][2], 2)
    push!(week1[6], dict["calfRaise"][1], dict["calfRaise"][2], 1)
    push!(week1[6], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week1[6], dict["dips"][1], dict["dips"][2], 3)
    push!(week1[6], dict["paraCrunch"][1], dict["paraCrunch"][2], 1)

    # Week 2
    push!(week2[1], dict["BenchT1"][1], dict["BenchT1"][2], 3)
    push!(week2[1], dict["BenchT2"][1], dict["BenchT2"][2], 3)
    push!(week2[1], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week2[1], dict["wristExt"][1], dict["wristExt"][2])
    push!(week2[1], dict["dragonFlag"][1], dict["dragonFlag"][2])
    push!(week2[1], dict["frontLever"][1], dict["frontLever"][2])
    push!(week2[1], dict["lunges"][1], dict["lunges"][2], 1)
    push!(week2[1], dict["facePull"][1], dict["facePull"][2], 3)
    push!(week2[1], dict["legRaise"][1], dict["legRaise"][2], 3)

    push!(week2[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 2)
    push!(week2[2], dict["RowT2"][1], dict["RowT2"][2], 2)
    push!(week2[2], dict["sideRaise"][1], dict["sideRaise"][2], 3)
    push!(week2[2], dict["hammerCurl"][1], dict["hammerCurl"][2], 3)
    push!(week2[2], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 1)
    push!(week2[2], dict["platePinch"][1], dict["platePinch"][2])
    push!(week2[2], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 3)
    push!(week2[2], dict["vsit"][1], dict["vsit"][2])

    push!(week2[3], dict["SquatT1"][1], dict["SquatT1"][2], 2)
    push!(week2[3], dict["PressT1"][1], dict["PressT1"][2], 1)
    push!(week2[3], dict["backLever"][1], dict["backLever"][2])
    push!(week2[3], dict["pullup"][1], dict["pullup"][2], 3)
    push!(week2[3], dict["calfRaise"][1], dict["calfRaise"][2], 2)
    push!(week2[3], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week2[3], dict["dips"][1], dict["dips"][2], 1)
    push!(week2[3], dict["abRollout"][1], dict["abRollout"][2])

    push!(week2[4], dict["BenchT1"][1], dict["BenchT1"][2], 4)
    push!(week2[4], dict["BenchT2"][1], dict["BenchT2"][2], 4)
    push!(week2[4], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week2[4], dict["wristExt"][1], dict["wristExt"][2])
    push!(week2[4], dict["landMine"][1], dict["landMine"][2], 3)
    push!(week2[4], dict["frontLever"][1], dict["frontLever"][2])
    push!(week2[4], dict["bulgarianSplit"][1], dict["bulgarianSplit"][2], 1)
    push!(week2[4], dict["facePull"][1], dict["facePull"][2], 3)
    push!(week2[4], dict["toeToBar"][1], dict["toeToBar"][2])

    push!(week2[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 2)
    push!(week2[5], dict["RowT1"][1], dict["RowT1"][2], 2)
    push!(week2[5], dict["sideRaise"][1], dict["sideRaise"][2], 3)
    push!(week2[5], dict["hammerCurl"][1], dict["hammerCurl"][2], 3)
    push!(week2[5], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 1)
    push!(week2[5], dict["platePinch"][1], dict["platePinch"][2])
    push!(week2[5], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 3)
    push!(week2[5], dict["vsit"][1], dict["vsit"][2])

    push!(week2[6], dict["SquatT2"][1], dict["SquatT2"][2], 2)
    push!(week2[6], dict["PressT1"][1], dict["PressT1"][2], 2)
    push!(week2[6], dict["backLever"][1], dict["backLever"][2])
    push!(week2[6], dict["pullup"][1], dict["pullup"][2], 3)
    push!(week2[6], dict["calfRaise"][1], dict["calfRaise"][2], 2)
    push!(week2[6], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week2[6], dict["dips"][1], dict["dips"][2], 1)
    push!(week2[6], dict["paraCrunch"][1], dict["paraCrunch"][2], 3)

    # Week3
    push!(week3[1], dict["BenchT1"][1], dict["BenchT1"][2], 5)
    push!(week3[1], dict["BenchT2"][1], dict["BenchT2"][2], 5)
    push!(week3[1], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week3[1], dict["wristExt"][1], dict["wristExt"][2])
    push!(week3[1], dict["dragonFlag"][1], dict["dragonFlag"][2])
    push!(week3[1], dict["frontLever"][1], dict["frontLever"][2])
    push!(week3[1], dict["lunges"][1], dict["lunges"][2], 3)
    push!(week3[1], dict["facePull"][1], dict["facePull"][2], 1)
    push!(week3[1], dict["legRaise"][1], dict["legRaise"][2], 1)

    push!(week3[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 3)
    push!(week3[2], dict["RowT2"][1], dict["RowT2"][2], 3)
    push!(week3[2], dict["sideRaise"][1], dict["sideRaise"][2], 1)
    push!(week3[2], dict["hammerCurl"][1], dict["hammerCurl"][2], 1)
    push!(week3[2], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 2)
    push!(week3[2], dict["platePinch"][1], dict["platePinch"][2])
    push!(week3[2], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 1)
    push!(week3[2], dict["vsit"][1], dict["vsit"][2])

    push!(week3[3], dict["SquatT1"][1], dict["SquatT1"][2], 3)
    push!(week3[3], dict["PressT1"][1], dict["PressT1"][2], 1)
    push!(week3[3], dict["backLever"][1], dict["backLever"][2])
    push!(week3[3], dict["pullup"][1], dict["pullup"][2], 1)
    push!(week3[3], dict["calfRaise"][1], dict["calfRaise"][2], 3)
    push!(week3[3], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week3[3], dict["dips"][1], dict["dips"][2], 2)
    push!(week3[3], dict["abRollout"][1], dict["abRollout"][2])

    push!(week3[4], dict["BenchT1"][1], dict["BenchT1"][2], 6)
    push!(week3[4], dict["BenchT2"][1], dict["BenchT2"][2], 6)
    push!(week3[4], dict["wristCurl"][1], dict["wristCurl"][2])
    push!(week3[4], dict["wristExt"][1], dict["wristExt"][2])
    push!(week3[4], dict["landMine"][1], dict["landMine"][2], 2)
    push!(week3[4], dict["frontLever"][1], dict["frontLever"][2])
    push!(week3[4], dict["bulgarianSplit"][1], dict["bulgarianSplit"][2], 2)
    push!(week3[4], dict["facePull"][1], dict["facePull"][2], 1)
    push!(week3[4], dict["toeToBar"][1], dict["toeToBar"][2])

    push!(week3[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 3)
    push!(week3[5], dict["RowT1"][1], dict["RowT1"][2], 3)
    push!(week3[5], dict["sideRaise"][1], dict["sideRaise"][2], 1)
    push!(week3[5], dict["hammerCurl"][1], dict["hammerCurl"][2], 1)
    push!(week3[5], dict["inclineDBBench"][1], dict["inclineDBBench"][2], 2)
    push!(week3[5], dict["platePinch"][1], dict["platePinch"][2])
    push!(week3[5], dict["zottmanCurl"][1], dict["zottmanCurl"][2], 1)
    push!(week3[5], dict["vsit"][1], dict["vsit"][2])

    push!(week3[6], dict["SquatT2"][1], dict["SquatT2"][2], 3)
    push!(week3[6], dict["PressT1"][1], dict["PressT1"][2], 2)
    push!(week3[6], dict["backLever"][1], dict["backLever"][2])
    push!(week3[6], dict["pullup"][1], dict["pullup"][2], 1)
    push!(week3[6], dict["calfRaise"][1], dict["calfRaise"][2], 3)
    push!(week3[6], dict["fingerCurl"][1], dict["fingerCurl"][2])
    push!(week3[6], dict["dips"][1], dict["dips"][2], 2)
    push!(week3[6], dict["paraCrunch"][1], dict["paraCrunch"][2], 2)

    return [
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
    ]
end

days = makeDays(nSunsCAP3_OHP_6Day_LP(), exerProg)
push!(Lifting_Programmes, nameProgramme => Programme(typeProgramme, nameProgramme, exerProg, days))
