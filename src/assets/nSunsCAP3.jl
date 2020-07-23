struct nSunsCAP3 <: AbstractProgramme end
typeProgramme = nSunsCAP3()
nameProgramme = "nSunsCAP3"
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
push!(exerProg, "BenchT1" => (exercise = BenchT1, progression = CAP3_Bench_T1))
push!(exerProg, "BenchT2" => (exercise = BenchT2, progression = CAP3_Bench_T2))

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
push!(exerProg, "DeadliftT1" => (exercise = DeadliftT1, progression = CAP3_Deadlift_T1))
push!(exerProg, "DeadliftT2" => (exercise = DeadliftT2, progression = CAP3_Deadlift_T2))
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
push!(exerProg, "SquatT1" => (exercise = SquatT1, progression = CAP3_Squat_T1))
push!(exerProg, "SquatT2" => (exercise = SquatT2, progression = CAP3_Squat_T2))

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
PressT2 = Exercise(
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 60,
)
push!(exerProg, "PressT1" => (exercise = PressT1, progression = CAP3_OHP_T1))
push!(exerProg, "PressT2" => (exercise = PressT2, progression = CAP3_OHP_T2))

## Weeks
import Lifting: makeDays
function makeDays(::nSunsCAP3, dict::Dict)
    week1 = [[], [], [], [], [], [], []]
    week2 = [[], [], [], [], [], [], []]
    week3 = [[], [], [], [], [], [], []]

    push!(week1[1], dict["BenchT1"][1], dict["BenchT1"][2], 1)
    push!(week1[1], dict["BenchT2"][1], dict["BenchT2"][2], 1)

    push!(week1[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 1)
    push!(week1[2], dict["RowT2"][1], dict["RowT2"][2], 1)

    push!(week1[3], dict["SquatT1"][1], dict["SquatT1"][2], 1)
    push!(week1[3], dict["PressT2"][1], dict["PressT2"][2], 1)

    push!(week1[4], dict["BenchT1"][1], dict["BenchT1"][2], 2)
    push!(week1[4], dict["BenchT2"][1], dict["BenchT2"][2], 2)

    push!(week1[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 1)
    push!(week1[5], dict["RowT1"][1], dict["RowT1"][2], 1)

    push!(week1[6], dict["SquatT2"][1], dict["SquatT2"][2], 1)
    push!(week1[6], dict["PressT1"][1], dict["PressT1"][2], 1)

    # Week 2
    push!(week2[1], dict["BenchT1"][1], dict["BenchT1"][2], 3)
    push!(week2[1], dict["BenchT2"][1], dict["BenchT2"][2], 3)

    push!(week2[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 2)
    push!(week2[2], dict["RowT2"][1], dict["RowT2"][2], 2)

    push!(week2[3], dict["SquatT1"][1], dict["SquatT1"][2], 2)
    push!(week2[3], dict["PressT2"][1], dict["PressT2"][2], 2)

    push!(week2[4], dict["BenchT1"][1], dict["BenchT1"][2], 4)
    push!(week2[4], dict["BenchT2"][1], dict["BenchT2"][2], 4)

    push!(week2[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 2)
    push!(week2[5], dict["RowT1"][1], dict["RowT1"][2], 2)

    push!(week2[6], dict["SquatT2"][1], dict["SquatT2"][2], 2)
    push!(week2[6], dict["PressT1"][1], dict["PressT1"][2], 2)

    # Week3
    push!(week3[1], dict["BenchT1"][1], dict["BenchT1"][2], 5)
    push!(week3[1], dict["BenchT2"][1], dict["BenchT2"][2], 5)

    push!(week3[2], dict["DeadliftT2"][1], dict["DeadliftT2"][2], 3)
    push!(week3[2], dict["RowT2"][1], dict["RowT2"][2], 3)

    push!(week3[3], dict["SquatT1"][1], dict["SquatT1"][2], 3)
    push!(week3[3], dict["PressT2"][1], dict["PressT2"][2], 3)

    push!(week3[4], dict["BenchT1"][1], dict["BenchT1"][2], 6)
    push!(week3[4], dict["BenchT2"][1], dict["BenchT2"][2], 6)

    push!(week3[5], dict["DeadliftT1"][1], dict["DeadliftT1"][2], 3)
    push!(week3[5], dict["RowT1"][1], dict["RowT1"][2], 3)

    push!(week3[6], dict["SquatT2"][1], dict["SquatT2"][2], 3)
    push!(week3[6], dict["PressT1"][1], dict["PressT1"][2], 3)

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

days = makeDays(nSunsCAP3(), exerProg)
push!(Lifting_Programmes, nameProgramme => Programme(typeProgramme, nameProgramme, exerProg, days))
