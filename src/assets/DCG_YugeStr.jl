struct DCG_YugeStr <: AbstractProgramme end
typeProgramme = DCG_YugeStr()
nameProgramme = "DCG_YugeStr"
exerProg = Dict()

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
push!(exerProg, "SquatT1" => (exercise = SquatT1, progression = deepcopy(DCGYugeStrT1)))
push!(exerProg, "SquatT2" => (exercise = SquatT2, progression = deepcopy(DCGYugeStrT2)))

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
    trainingMax = 92.5,
)
push!(exerProg, "BenchT1" => (exercise = BenchT1, progression = deepcopy(DCGYugeStrT1)))
push!(exerProg, "BenchT2" => (exercise = BenchT2, progression = deepcopy(DCGYugeStrT2)))

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
    "DeadliftT1" => (exercise = DeadliftT1, progression = deepcopy(DCGYugeStrT1)),
)
push!(
    exerProg,
    "DeadliftT2" => (exercise = DeadliftT2, progression = deepcopy(DCGYugeStrT2)),
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
push!(exerProg, "RowT1" => (exercise = RowT1, progression = deepcopy(DCGYugeStrT1)))
push!(exerProg, "RowT2" => (exercise = RowT2, progression = deepcopy(DCGYugeStrT2)))

OHPT1 = Exercise(;
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 60,
)
OHPT2 = Exercise(;
    name = press["db ohp"],
    equipment = equipment["db"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 50,
)
push!(exerProg, "OHPT1" => (exercise = OHPT1, progression = deepcopy(DCGYugeStrT1)))
push!(exerProg, "OHPT2" => (exercise = OHPT2, progression = deepcopy(DCGYugeStrT2)))

PullupT1 = Exercise(;
    name = pull["pullup"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["biceps"], muscles["brachialis"]],
    trainingMax = 12.5,
    roundBase = 1.25,
)
PullupT2 = Exercise(;
    name = pull["archer"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["biceps"], muscles["brachialis"]],
    trainingMax = 0,
    roundBase = 1.25,
)
push!(exerProg, "PullupT1" => (exercise = PullupT1, progression = deepcopy(DCGYugeStrT3)))
push!(exerProg, "PullupT2" => (exercise = PullupT2, progression = deepcopy(DCGYugeStrT3)))

Dips = Exercise(;
    name = bench["dips"],
    equipment = [equipment["parallette"], equipment["chain belt"]],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 12.5,
    roundBase = 1.25,
)
InclineDBBench = Exercise(;
    name = bench["db incline"],
    equipment = equipment["db"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 45,
)
push!(exerProg, "Dips" => (exercise = Dips, progression = deepcopy(DCGYugeStrT3)))
push!(
    exerProg,
    "InclineDBBench" => (exercise = InclineDBBench, progression = deepcopy(DCGYugeStrT3)),
)

HipThrustT1 = Exercise(;
    name = deadlift["hip thrust"],
    equipment = equipment["bb"],
    muscles = [
        muscles["hamstrings"],
        muscles["glutes"],
        muscles["spinal erectors"],
        muscles["quads"],
    ],
    trainingMax = 100,
)
HipThrustT2 = Exercise(;
    name = deadlift["single leg hip thrust"],
    equipment = equipment["bb"],
    muscles = [
        muscles["hamstrings"],
        muscles["glutes"],
        muscles["spinal erectors"],
        muscles["quads"],
    ],
    trainingMax = 10,
)
push!(
    exerProg,
    "HipThrustT1" => (exercise = HipThrustT1, progression = deepcopy(DCGYugeStrT1)),
)
push!(
    exerProg,
    "HipThrustT2" => (exercise = HipThrustT2, progression = deepcopy(DCGYugeStrT2)),
)

Lunges = Exercise(;
    name = squat["lunge"],
    modality = [modality["walking"], modality["backstep"], modality["dragon"]],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 47.5,
)
BulgarianSplit = Exercise(;
    name = squat["bulgarian"],
    equipment = equipment["db"],
    muscles = [muscles["quads"], muscles["glutes"]],
    trainingMax = 37.5,
)
push!(exerProg, "Lunges" => (exercise = Lunges, progression = deepcopy(DCGYugeStrT3)))
push!(
    exerProg,
    "BulgarianSplit" => (exercise = BulgarianSplit, progression = deepcopy(DCGYugeStrT3)),
)

# Grip
WristExt = Exercise(;
    name = grip["wrist extension"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
    roundBase = 1,
)
WristCurl = Exercise(;
    name = grip["wrist curl"],
    equipment = equipment["db"],
    muscles = muscles["wrist extensors"],
    trainingMax = 10,
    roundBase = 1,
)
FingerCurl = Exercise(;
    name = grip["finger curl"],
    equipment = equipment["db"],
    muscles = muscles["finger flexors"],
    trainingMax = 20,
)
PlatePinch = Exercise(;
    name = grip["plate pinch"],
    equipment = equipment["plate"],
    muscles = muscles["hand"],
    trainingMax = 27.5,
)
push!(exerProg, "WristExt" => (exercise = wristExt, progression = deepcopy(DCGYugeStrT4)))
push!(exerProg, "WristCurl" => (exercise = wristCurl, progression = deepcopy(DCGYugeStrT4)))
push!(
    exerProg,
    "FingerCurl" => (exercise = FingerCurl, progression = deepcopy(DCGYugeStrT4)),
)
push!(
    exerProg,
    "PlatePinch" => (exercise = PlatePinch, progression = deepcopy(DCGYugeStrT4)),
)

# Core
DragonFlag = Exercise(;
    name = core["dragon flag"],
    equipment = equipment["none"],
    muscles = muscles["core"],
    trainingMax = 10,
)
ParaCrunch = Exercise(;
    name = core["v sit"],
    equipment = equipment["parallette"],
    muscles = muscles["core"],
    trainingMax = 10,
)
LegRaise = Exercise(;
    name = core["leg raise"],
    equipment = equipment["pullup bar"],
    muscles = muscles["core"],
    trainingMax = 12.5,
)
AbRollout = Exercise(;
    name = core["ab roll"],
    modality = modality["kneeling"],
    equipment = equipment["ab wheel"],
    muscles = muscles["core"],
    trainingMax = 10,
)
LandMine = Exercise(;
    name = core["landmine"],
    equipment = equipment["bb"],
    muscles = muscles["core"],
    trainingMax = 50,
)
ParaCrunch = Exercise(;
    name = core["parallette crunch"],
    equipment = [equipment["parallette"], equipment["db"]],
    muscles = muscles["core"],
    trainingMax = 15,
)
Vsit = Exercise(;
    name = core["v sit"],
    equipment = equipment["parallette"],
    muscles = muscles["core"],
    trainingMax = 10,
)
push!(exerProg, "DragonFlag" => (exercise = DragonFlag, progression = deepcopy(AMRAP_Cali)))
push!(exerProg, "ParaCrunch" => (exercise = ParaCrunch, progression = deepcopy(AMRAP_Cali)))
push!(exerProg, "LegRaise" => (exercise = LegRaise, progression = deepcopy(DCGYugeStrT3)))
push!(exerProg, "AbRollout" => (exercise = AbRollout, progression = deepcopy(AMRAP_Cali)))
push!(exerProg, "LandMine" => (exercise = LandMine, progression = deepcopy(DCGYugeStrT3)))
push!(
    exerProg,
    "ParaCrunch" => (exercise = ParaCrunch, progression = deepcopy(DCGYugeStrT3)),
)
push!(exerProg, "Vsit" => (exercise = Vsit, progression = deepcopy(AMRAP_Cali)))

# Calisthenics Isometrics
FrontLever = Exercise(;
    name = isometric["front"],
    modality = modality["one leg out"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["core"]],
    trainingMax = 15,
)
BackLever = Exercise(;
    name = isometric["back"],
    modality = modality["straddle"],
    equipment = equipment["pullup bar"],
    muscles = [muscles["lats"], muscles["pecs"], muscles["front delts"], muscles["core"]],
    trainingMax = 15,
)
push!(exerProg, "FrontLever" => (exercise = FrontLever, progression = deepcopy(AMRAP_Cali)))
push!(exerProg, "BackLever" => (exercise = BackLever, progression = deepcopy(AMRAP_Cali)))

# Misc
FacePull = Exercise(;
    name = pull["face"],
    equipment = equipment["cable"],
    muscles = [muscles["rear delts"], muscles["rhomboids"], muscles["rot cuff"]],
    trainingMax = 30,
)
HammerCurl = Exercise(;
    name = pull["hammer"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["brachialis"], muscles["biceps"]],
    trainingMax = 20,
)
ZottmanCurl = Exercise(;
    name = pull["zottman"],
    equipment = [equipment["db"], equipment["fat grips"]],
    muscles = [muscles["biceps"], muscles["brachialis"]],
    trainingMax = 12.5,
)
SideRaise = Exercise(;
    name = press["side raise"],
    equipment = equipment["db"],
    muscles = muscles["side delts"],
    trainingMax = 12.5,
)
CalfRaise = Exercise(;
    name = squat["calf raise"],
    modality = modality["standing"],
    equipment = equipment["db"],
    muscles = muscles["calves"],
    trainingMax = 20,
)
push!(exerProg, "FacePull" => (exercise = FacePull, progression = deepcopy(DCGYugeStrT4)))
push!(
    exerProg,
    "HammerCurl" => (exercise = HammerCurl, progression = deepcopy(DCGYugeStrT4)),
)
push!(
    exerProg,
    "ZottmanCurl" => (exercise = ZottmanCurl, progression = deepcopy(DCGYugeStrT4)),
)
push!(exerProg, "SideRaise" => (exercise = SideRaise, progression = deepcopy(DCGYugeStrT4)))
push!(exerProg, "CalfRaise" => (exercise = CalfRaise, progression = deepcopy(DCGYugeStrT4)))

import Lifting: makeDays
function makeDays(::DCG_YugeStr, dict::Dict)
    week1 = [[], [], [], [], [], [], []]
    week2 = [[], [], [], [], [], [], []]
    week3 = [[], [], [], [], [], [], []]
    week4 = [[], [], [], [], [], [], []]
    week5 = [[], [], [], [], [], [], []]
    week6 = [[], [], [], [], [], [], []]
    week7 = [[], [], [], [], [], [], []]
    week8 = [[], [], [], [], [], [], []]
    week9 = [[], [], [], [], [], [], []]

    #=
        Day 1
            bench 1
            wrist extension
            wrist flexion
            dragon flag
            row 2
            front lever
            lunges
            face pull
    =#
    push!(week1[1], dict["BenchT1"][1], dict["BenchT1"][2], 1)
    push!(week2[1], dict["BenchT1"][1], dict["BenchT1"][2], 2)
    push!(week3[1], dict["BenchT1"][1], dict["BenchT1"][2], 3)
    push!(week4[1], dict["BenchT1"][1], dict["BenchT1"][2], 4)
    push!(week5[1], dict["BenchT1"][1], dict["BenchT1"][2], 5)
    push!(week6[1], dict["BenchT1"][1], dict["BenchT1"][2], 6)
    push!(week7[1], dict["BenchT1"][1], dict["BenchT1"][2], 7)
    push!(week8[1], dict["BenchT1"][1], dict["BenchT1"][2], 8)
    push!(week9[1], dict["BenchT1"][1], dict["BenchT1"][2], 9)

    push!(week1[1], dict["WristExt"][1], dict["WristExt"][2], 2)
    push!(week2[1], dict["WristExt"][1], dict["WristExt"][2], 3)
    push!(week3[1], dict["WristExt"][1], dict["WristExt"][2], 4)
    push!(week4[1], dict["WristExt"][1], dict["WristExt"][2], 5)
    push!(week5[1], dict["WristExt"][1], dict["WristExt"][2], 6)
    push!(week6[1], dict["WristExt"][1], dict["WristExt"][2], 7)
    push!(week7[1], dict["WristExt"][1], dict["WristExt"][2], 8)
    push!(week8[1], dict["WristExt"][1], dict["WristExt"][2], 9)

    push!(week1[1], dict["WristCurl"][1], dict["WristCurl"][2], 2)
    push!(week2[1], dict["WristCurl"][1], dict["WristCurl"][2], 3)
    push!(week3[1], dict["WristCurl"][1], dict["WristCurl"][2], 4)
    push!(week4[1], dict["WristCurl"][1], dict["WristCurl"][2], 5)
    push!(week5[1], dict["WristCurl"][1], dict["WristCurl"][2], 6)
    push!(week6[1], dict["WristCurl"][1], dict["WristCurl"][2], 7)
    push!(week7[1], dict["WristCurl"][1], dict["WristCurl"][2], 8)
    push!(week8[1], dict["WristCurl"][1], dict["WristCurl"][2], 9)

    push!(week1[1], dict["RowT2"][1], dict["RowT2"][2], 1)
    push!(week2[1], dict["RowT2"][1], dict["RowT2"][2], 2)
    push!(week3[1], dict["RowT2"][1], dict["RowT2"][2], 3)
    push!(week4[1], dict["RowT2"][1], dict["RowT2"][2], 4)
    push!(week5[1], dict["RowT2"][1], dict["RowT2"][2], 5)
    push!(week6[1], dict["RowT2"][1], dict["RowT2"][2], 6)
    push!(week7[1], dict["RowT2"][1], dict["RowT2"][2], 7)
    push!(week8[1], dict["RowT2"][1], dict["RowT2"][2], 8)
    push!(week9[1], dict["RowT2"][1], dict["RowT2"][2], 9)

    push!(week1[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week2[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week3[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week4[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week5[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week6[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week7[1], dict["DragonFlag"][1], dict["DragonFlag"][2])
    push!(week8[1], dict["DragonFlag"][1], dict["DragonFlag"][2])

    push!(week1[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week2[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week3[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week4[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week5[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week6[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week7[1], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week8[1], dict["FrontLever"][1], dict["FrontLever"][2])

    push!(week1[1], dict["Lunges"][1], dict["Lunges"][2], 2)
    push!(week2[1], dict["Lunges"][1], dict["Lunges"][2], 3)
    push!(week3[1], dict["Lunges"][1], dict["Lunges"][2], 4)
    push!(week4[1], dict["Lunges"][1], dict["Lunges"][2], 5)
    push!(week5[1], dict["Lunges"][1], dict["Lunges"][2], 6)
    push!(week6[1], dict["Lunges"][1], dict["Lunges"][2], 7)
    push!(week7[1], dict["Lunges"][1], dict["Lunges"][2], 8)
    push!(week8[1], dict["Lunges"][1], dict["Lunges"][2], 9)

    push!(week1[1], dict["FacePull"][1], dict["FacePull"][2], 1)
    push!(week2[1], dict["FacePull"][1], dict["FacePull"][2], 2)
    push!(week3[1], dict["FacePull"][1], dict["FacePull"][2], 3)
    push!(week4[1], dict["FacePull"][1], dict["FacePull"][2], 4)
    push!(week5[1], dict["FacePull"][1], dict["FacePull"][2], 5)
    push!(week6[1], dict["FacePull"][1], dict["FacePull"][2], 6)
    push!(week7[1], dict["FacePull"][1], dict["FacePull"][2], 7)
    push!(week8[1], dict["FacePull"][1], dict["FacePull"][2], 8)
    push!(week9[1], dict["FacePull"][1], dict["FacePull"][2], 9)
    #=
        Day 2
            squat 2
            ohp 1
            pullup 2
            back lever
            calf raises
            finger curls
            leg raises
    =#
    push!(week1[2], dict["SquatT2"][1], dict["SquatT2"][2], 1)
    push!(week2[2], dict["SquatT2"][1], dict["SquatT2"][2], 2)
    push!(week3[2], dict["SquatT2"][1], dict["SquatT2"][2], 3)
    push!(week4[2], dict["SquatT2"][1], dict["SquatT2"][2], 4)
    push!(week5[2], dict["SquatT2"][1], dict["SquatT2"][2], 5)
    push!(week6[2], dict["SquatT2"][1], dict["SquatT2"][2], 6)
    push!(week7[2], dict["SquatT2"][1], dict["SquatT2"][2], 7)
    push!(week8[2], dict["SquatT2"][1], dict["SquatT2"][2], 8)
    push!(week9[2], dict["SquatT2"][1], dict["SquatT2"][2], 9)

    push!(week1[2], dict["OHPT1"][1], dict["OHPT1"][2], 1)
    push!(week2[2], dict["OHPT1"][1], dict["OHPT1"][2], 2)
    push!(week3[2], dict["OHPT1"][1], dict["OHPT1"][2], 3)
    push!(week4[2], dict["OHPT1"][1], dict["OHPT1"][2], 4)
    push!(week5[2], dict["OHPT1"][1], dict["OHPT1"][2], 5)
    push!(week6[2], dict["OHPT1"][1], dict["OHPT1"][2], 6)
    push!(week7[2], dict["OHPT1"][1], dict["OHPT1"][2], 7)
    push!(week8[2], dict["OHPT1"][1], dict["OHPT1"][2], 8)
    push!(week9[2], dict["OHPT1"][1], dict["OHPT1"][2], 9)

    push!(week1[2], dict["PullupT2"][1], dict["PullupT2"][2], 1)
    push!(week2[2], dict["PullupT2"][1], dict["PullupT2"][2], 2)
    push!(week3[2], dict["PullupT2"][1], dict["PullupT2"][2], 3)
    push!(week4[2], dict["PullupT2"][1], dict["PullupT2"][2], 4)
    push!(week5[2], dict["PullupT2"][1], dict["PullupT2"][2], 5)
    push!(week6[2], dict["PullupT2"][1], dict["PullupT2"][2], 6)
    push!(week7[2], dict["PullupT2"][1], dict["PullupT2"][2], 7)
    push!(week8[2], dict["PullupT2"][1], dict["PullupT2"][2], 8)
    push!(week9[2], dict["PullupT2"][1], dict["PullupT2"][2], 9)

    push!(week1[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week2[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week3[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week4[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week5[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week6[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week7[2], dict["BackLever"][1], dict["BackLever"][2])
    push!(week8[2], dict["BackLever"][1], dict["BackLever"][2])

    push!(week1[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 2)
    push!(week2[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 3)
    push!(week3[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 4)
    push!(week4[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 5)
    push!(week5[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 6)
    push!(week6[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 7)
    push!(week7[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 8)
    push!(week8[2], dict["CalfRaise"][1], dict["CalfRaise"][2], 9)

    push!(week1[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 2)
    push!(week2[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 3)
    push!(week3[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 4)
    push!(week4[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 5)
    push!(week5[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 6)
    push!(week6[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 7)
    push!(week7[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 8)
    push!(week8[2], dict["FingerCurl"][1], dict["FingerCurl"][2], 9)

    push!(week1[2], dict["LegRaise"][1], dict["LegRaise"][2], 2)
    push!(week2[2], dict["LegRaise"][1], dict["LegRaise"][2], 3)
    push!(week3[2], dict["LegRaise"][1], dict["LegRaise"][2], 4)
    push!(week4[2], dict["LegRaise"][1], dict["LegRaise"][2], 5)
    push!(week5[2], dict["LegRaise"][1], dict["LegRaise"][2], 6)
    push!(week6[2], dict["LegRaise"][1], dict["LegRaise"][2], 7)
    push!(week7[2], dict["LegRaise"][1], dict["LegRaise"][2], 8)
    push!(week8[2], dict["LegRaise"][1], dict["LegRaise"][2], 9)

    #=
        Day 3
            deadlift 1
            hip thrust 2
            side raise
            dips
            bulgarian split
            plate pinch
            hammer curls
            v-sit
    =#
    push!(week1[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 1)
    push!(week2[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 2)
    push!(week3[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 3)
    push!(week4[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 4)
    push!(week5[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 5)
    push!(week6[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 6)
    push!(week7[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 7)
    push!(week8[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 8)
    push!(week9[3], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 9)

    push!(week1[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 1)
    push!(week2[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 2)
    push!(week3[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 3)
    push!(week4[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 4)
    push!(week5[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 5)
    push!(week6[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 6)
    push!(week7[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 7)
    push!(week8[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 8)
    push!(week9[3], dict["HipThrustT2"][1], dict["HipThrustT2"][2], 9)

    push!(week1[3], dict["SideRaise"][1], dict["SideRaise"][2], 2)
    push!(week2[3], dict["SideRaise"][1], dict["SideRaise"][2], 3)
    push!(week3[3], dict["SideRaise"][1], dict["SideRaise"][2], 4)
    push!(week4[3], dict["SideRaise"][1], dict["SideRaise"][2], 5)
    push!(week5[3], dict["SideRaise"][1], dict["SideRaise"][2], 6)
    push!(week6[3], dict["SideRaise"][1], dict["SideRaise"][2], 7)
    push!(week7[3], dict["SideRaise"][1], dict["SideRaise"][2], 8)
    push!(week8[3], dict["SideRaise"][1], dict["SideRaise"][2], 9)

    push!(week1[3], dict["Dips"][1], dict["Dips"][2], 1)
    push!(week2[3], dict["Dips"][1], dict["Dips"][2], 2)
    push!(week3[3], dict["Dips"][1], dict["Dips"][2], 3)
    push!(week4[3], dict["Dips"][1], dict["Dips"][2], 4)
    push!(week5[3], dict["Dips"][1], dict["Dips"][2], 5)
    push!(week6[3], dict["Dips"][1], dict["Dips"][2], 6)
    push!(week7[3], dict["Dips"][1], dict["Dips"][2], 7)
    push!(week8[3], dict["Dips"][1], dict["Dips"][2], 8)
    push!(week9[3], dict["Dips"][1], dict["Dips"][2], 9)

    push!(week1[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 2)
    push!(week2[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 3)
    push!(week3[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 4)
    push!(week4[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 5)
    push!(week5[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 6)
    push!(week6[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 7)
    push!(week7[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 8)
    push!(week8[3], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 9)

    push!(week1[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 2)
    push!(week2[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 3)
    push!(week3[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 4)
    push!(week4[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 5)
    push!(week5[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 6)
    push!(week6[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 7)
    push!(week7[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 8)
    push!(week8[3], dict["PlatePinch"][1], dict["PlatePinch"][2], 9)

    push!(week1[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 2)
    push!(week2[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 3)
    push!(week3[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 4)
    push!(week4[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 5)
    push!(week5[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 6)
    push!(week6[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 7)
    push!(week7[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 8)
    push!(week8[3], dict["HammerCurl"][1], dict["HammerCurl"][2], 9)

    push!(week1[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week2[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week3[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week4[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week5[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week6[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week7[3], dict["Vsit"][1], dict["Vsit"][2])
    push!(week8[3], dict["Vsit"][1], dict["Vsit"][2])

    #=
        Day 4
            Rest
    =#
    push!(week1[4], "Rest")
    push!(week2[4], "Rest")
    push!(week3[4], "Rest")
    push!(week4[4], "Rest")
    push!(week5[4], "Rest")
    push!(week6[4], "Rest")
    push!(week7[4], "Rest")
    push!(week8[4], "Rest")
    push!(week9[4], "Rest")

    #=
        Day 5
            bench 2
            land mine anti rotation
            row 1
            front lever
            lunges
            wrist extension
            wrist flexion
            face pull
    =#
    push!(week1[5], dict["BenchT2"][1], dict["BenchT2"][2], 1)
    push!(week2[5], dict["BenchT2"][1], dict["BenchT2"][2], 2)
    push!(week3[5], dict["BenchT2"][1], dict["BenchT2"][2], 3)
    push!(week4[5], dict["BenchT2"][1], dict["BenchT2"][2], 4)
    push!(week5[5], dict["BenchT2"][1], dict["BenchT2"][2], 5)
    push!(week6[5], dict["BenchT2"][1], dict["BenchT2"][2], 6)
    push!(week7[5], dict["BenchT2"][1], dict["BenchT2"][2], 7)
    push!(week8[5], dict["BenchT2"][1], dict["BenchT2"][2], 8)
    push!(week9[5], dict["BenchT2"][1], dict["BenchT2"][2], 9)

    push!(week1[5], dict["WristExt"][1], dict["WristExt"][2], 2)
    push!(week2[5], dict["WristExt"][1], dict["WristExt"][2], 3)
    push!(week3[5], dict["WristExt"][1], dict["WristExt"][2], 4)
    push!(week4[5], dict["WristExt"][1], dict["WristExt"][2], 5)
    push!(week5[5], dict["WristExt"][1], dict["WristExt"][2], 6)
    push!(week6[5], dict["WristExt"][1], dict["WristExt"][2], 7)
    push!(week7[5], dict["WristExt"][1], dict["WristExt"][2], 8)
    push!(week8[5], dict["WristExt"][1], dict["WristExt"][2], 9)

    push!(week1[5], dict["WristCurl"][1], dict["WristCurl"][2], 2)
    push!(week2[5], dict["WristCurl"][1], dict["WristCurl"][2], 3)
    push!(week3[5], dict["WristCurl"][1], dict["WristCurl"][2], 4)
    push!(week4[5], dict["WristCurl"][1], dict["WristCurl"][2], 5)
    push!(week5[5], dict["WristCurl"][1], dict["WristCurl"][2], 6)
    push!(week6[5], dict["WristCurl"][1], dict["WristCurl"][2], 7)
    push!(week7[5], dict["WristCurl"][1], dict["WristCurl"][2], 8)
    push!(week8[5], dict["WristCurl"][1], dict["WristCurl"][2], 9)

    push!(week1[5], dict["RowT1"][1], dict["RowT1"][2], 1)
    push!(week2[5], dict["RowT1"][1], dict["RowT1"][2], 2)
    push!(week3[5], dict["RowT1"][1], dict["RowT1"][2], 3)
    push!(week4[5], dict["RowT1"][1], dict["RowT1"][2], 4)
    push!(week5[5], dict["RowT1"][1], dict["RowT1"][2], 5)
    push!(week6[5], dict["RowT1"][1], dict["RowT1"][2], 6)
    push!(week7[5], dict["RowT1"][1], dict["RowT1"][2], 7)
    push!(week8[5], dict["RowT1"][1], dict["RowT1"][2], 8)
    push!(week9[5], dict["RowT1"][1], dict["RowT1"][2], 9)

    push!(week1[5], dict["LandMine"][1], dict["LandMine"][2], 2)
    push!(week2[5], dict["LandMine"][1], dict["LandMine"][2], 3)
    push!(week3[5], dict["LandMine"][1], dict["LandMine"][2], 4)
    push!(week4[5], dict["LandMine"][1], dict["LandMine"][2], 5)
    push!(week5[5], dict["LandMine"][1], dict["LandMine"][2], 6)
    push!(week6[5], dict["LandMine"][1], dict["LandMine"][2], 7)
    push!(week7[5], dict["LandMine"][1], dict["LandMine"][2], 8)
    push!(week8[5], dict["LandMine"][1], dict["LandMine"][2], 9)

    push!(week1[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week2[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week3[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week4[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week5[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week6[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week7[5], dict["FrontLever"][1], dict["FrontLever"][2])
    push!(week8[5], dict["FrontLever"][1], dict["FrontLever"][2])

    push!(week1[5], dict["Lunges"][1], dict["Lunges"][2], 2)
    push!(week2[5], dict["Lunges"][1], dict["Lunges"][2], 3)
    push!(week3[5], dict["Lunges"][1], dict["Lunges"][2], 4)
    push!(week4[5], dict["Lunges"][1], dict["Lunges"][2], 5)
    push!(week5[5], dict["Lunges"][1], dict["Lunges"][2], 6)
    push!(week6[5], dict["Lunges"][1], dict["Lunges"][2], 7)
    push!(week7[5], dict["Lunges"][1], dict["Lunges"][2], 8)
    push!(week8[5], dict["Lunges"][1], dict["Lunges"][2], 9)

    push!(week1[5], dict["FacePull"][1], dict["FacePull"][2], 1)
    push!(week2[5], dict["FacePull"][1], dict["FacePull"][2], 2)
    push!(week3[5], dict["FacePull"][1], dict["FacePull"][2], 3)
    push!(week4[5], dict["FacePull"][1], dict["FacePull"][2], 4)
    push!(week5[5], dict["FacePull"][1], dict["FacePull"][2], 5)
    push!(week6[5], dict["FacePull"][1], dict["FacePull"][2], 6)
    push!(week7[5], dict["FacePull"][1], dict["FacePull"][2], 7)
    push!(week8[5], dict["FacePull"][1], dict["FacePull"][2], 8)
    push!(week9[5], dict["FacePull"][1], dict["FacePull"][2], 9)

    #=
        Day 6
            squat 1
            ohp 2
            pullup
            back lever
            calf raises
            finger curls
            ab wheel
    =#
    push!(week1[6], dict["SquatT1"][1], dict["SquatT1"][2], 1)
    push!(week2[6], dict["SquatT1"][1], dict["SquatT1"][2], 2)
    push!(week3[6], dict["SquatT1"][1], dict["SquatT1"][2], 3)
    push!(week4[6], dict["SquatT1"][1], dict["SquatT1"][2], 4)
    push!(week5[6], dict["SquatT1"][1], dict["SquatT1"][2], 5)
    push!(week6[6], dict["SquatT1"][1], dict["SquatT1"][2], 6)
    push!(week7[6], dict["SquatT1"][1], dict["SquatT1"][2], 7)
    push!(week8[6], dict["SquatT1"][1], dict["SquatT1"][2], 8)
    push!(week9[6], dict["SquatT1"][1], dict["SquatT1"][2], 9)

    push!(week1[6], dict["OHPT2"][1], dict["OHPT2"][2], 1)
    push!(week2[6], dict["OHPT2"][1], dict["OHPT2"][2], 2)
    push!(week3[6], dict["OHPT2"][1], dict["OHPT2"][2], 3)
    push!(week4[6], dict["OHPT2"][1], dict["OHPT2"][2], 4)
    push!(week5[6], dict["OHPT2"][1], dict["OHPT2"][2], 5)
    push!(week6[6], dict["OHPT2"][1], dict["OHPT2"][2], 6)
    push!(week7[6], dict["OHPT2"][1], dict["OHPT2"][2], 7)
    push!(week8[6], dict["OHPT2"][1], dict["OHPT2"][2], 8)
    push!(week9[6], dict["OHPT2"][1], dict["OHPT2"][2], 9)

    push!(week1[6], dict["PullupT1"][1], dict["PullupT1"][2], 1)
    push!(week2[6], dict["PullupT1"][1], dict["PullupT1"][2], 2)
    push!(week3[6], dict["PullupT1"][1], dict["PullupT1"][2], 3)
    push!(week4[6], dict["PullupT1"][1], dict["PullupT1"][2], 4)
    push!(week5[6], dict["PullupT1"][1], dict["PullupT1"][2], 5)
    push!(week6[6], dict["PullupT1"][1], dict["PullupT1"][2], 6)
    push!(week7[6], dict["PullupT1"][1], dict["PullupT1"][2], 7)
    push!(week8[6], dict["PullupT1"][1], dict["PullupT1"][2], 8)
    push!(week9[6], dict["PullupT1"][1], dict["PullupT1"][2], 9)

    push!(week1[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week2[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week3[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week4[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week5[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week6[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week7[6], dict["BackLever"][1], dict["BackLever"][2])
    push!(week8[6], dict["BackLever"][1], dict["BackLever"][2])

    push!(week1[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 2)
    push!(week2[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 3)
    push!(week3[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 4)
    push!(week4[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 5)
    push!(week5[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 6)
    push!(week6[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 7)
    push!(week7[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 8)
    push!(week8[6], dict["CalfRaise"][1], dict["CalfRaise"][2], 9)

    push!(week1[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 2)
    push!(week2[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 3)
    push!(week3[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 4)
    push!(week4[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 5)
    push!(week5[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 6)
    push!(week6[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 7)
    push!(week7[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 8)
    push!(week8[6], dict["FingerCurl"][1], dict["FingerCurl"][2], 9)

    push!(week1[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week2[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week3[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week4[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week5[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week6[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week7[6], dict["AbRollout"][1], dict["AbRollout"][2])
    push!(week8[6], dict["AbRollout"][1], dict["AbRollout"][2])

    #=
        Day 7
            deadlift 2
            hip thrust 1
            side raise
            incline db bench
            bulgarian split
            plate pinch
            zottman curls
            paralette crunch
    =#
    push!(week1[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 1)
    push!(week2[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 2)
    push!(week3[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 3)
    push!(week4[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 4)
    push!(week5[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 5)
    push!(week6[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 6)
    push!(week7[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 7)
    push!(week8[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 8)
    push!(week9[7], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 9)

    push!(week1[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 1)
    push!(week2[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 2)
    push!(week3[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 3)
    push!(week4[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 4)
    push!(week5[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 5)
    push!(week6[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 6)
    push!(week7[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 7)
    push!(week8[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 8)
    push!(week9[7], dict["HipThrustT1"][1], dict["HipThrustT1"][2], 9)

    push!(week1[7], dict["SideRaise"][1], dict["SideRaise"][2], 2)
    push!(week2[7], dict["SideRaise"][1], dict["SideRaise"][2], 3)
    push!(week3[7], dict["SideRaise"][1], dict["SideRaise"][2], 4)
    push!(week4[7], dict["SideRaise"][1], dict["SideRaise"][2], 5)
    push!(week5[7], dict["SideRaise"][1], dict["SideRaise"][2], 6)
    push!(week6[7], dict["SideRaise"][1], dict["SideRaise"][2], 7)
    push!(week7[7], dict["SideRaise"][1], dict["SideRaise"][2], 8)
    push!(week8[7], dict["SideRaise"][1], dict["SideRaise"][2], 9)

    push!(week1[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 1)
    push!(week2[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 2)
    push!(week3[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 3)
    push!(week4[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 4)
    push!(week5[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 5)
    push!(week6[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 6)
    push!(week7[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 7)
    push!(week8[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 8)
    push!(week9[7], dict["InclineDBBench"][1], dict["InclineDBBench"][2], 9)

    push!(week1[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 2)
    push!(week2[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 3)
    push!(week3[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 4)
    push!(week4[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 5)
    push!(week5[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 6)
    push!(week6[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 7)
    push!(week7[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 8)
    push!(week8[7], dict["BulgarianSplit"][1], dict["BulgarianSplit"][2], 9)

    push!(week1[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 2)
    push!(week2[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 3)
    push!(week3[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 4)
    push!(week4[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 5)
    push!(week5[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 6)
    push!(week6[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 7)
    push!(week7[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 8)
    push!(week8[7], dict["PlatePinch"][1], dict["PlatePinch"][2], 9)

    push!(week1[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 2)
    push!(week2[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 3)
    push!(week3[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 4)
    push!(week4[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 5)
    push!(week5[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 6)
    push!(week6[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 7)
    push!(week7[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 8)
    push!(week8[7], dict["ZottmanCurl"][1], dict["ZottmanCurl"][2], 9)

    push!(week1[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 2)
    push!(week2[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 3)
    push!(week3[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 4)
    push!(week4[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 5)
    push!(week5[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 6)
    push!(week6[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 7)
    push!(week7[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 8)
    push!(week8[7], dict["ParaCrunch"][1], dict["ParaCrunch"][2], 9)

    return vcat(week1, week2, week3, week4, week5, week6, week7, week8, week9)
end

days = makeDays(typeProgramme, exerProg)
push!(
    Lifting_Programmes,
    nameProgramme => Programme(typeProgramme, nameProgramme, exerProg, days),
)
