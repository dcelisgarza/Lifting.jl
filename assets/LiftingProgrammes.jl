using Lifting, Revise
include("LiftingDictionaries.jl")

###
# Bench 1
BenchT1 = Exercise(
    name = bench[1],
    equipment = equipment[1],
    muscles = [muscles[1], muscles[2], muscles[3]],
    trainingMax = 92.5,
)
SetsCAP3BenchT1 = [
    # Week 1
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [0.735, 0.735, 0.735],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [0.68, 0.68, 0.71],
        addWeight = [0, 5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [0.77, 0.77, 0.77],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType[1], setType[1], setType[6]],
        sets = [4, 4, 1],
        reps = [6, 5, 5],
        intensity = [0.725, 0.74, 0.755],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType[5], setType[5], setType[5]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        addWeight = [0, 0, 0],
        roundMode = [ceil, ceil, ceil],
    ),
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [0.62, 0.625, 0.65],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
]
ProgCAP3BenchT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Bench T1",
    sessions = 2,
    period = 3,
    setScheme = SetsCAP3BenchT1,
)
calcWeights.(BenchT1, SetsCAP3BenchT1)
# Bench 2
BenchT2 = Exercise(
    name = bench[4],
    equipment = equipment[1],
    muscles = [muscles[1], muscles[2], muscles[3]],
    trainingMax = 75,
)
SetsCAP3BenchT2 = [
    # Week 1
    SetScheme(
        type = [setType[2], setType[2], setType[4]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [intensityArb(12), intensityArb(15), intensityArb(15)],
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType[2], setType[2], setType[4]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [intensityArb(10), intensityArb(12), intensityArb(12)],
        roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType[2], setType[2], setType[4]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [intensityArb(10), intensityArb(12), intensityArb(12)],
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType[1], setType[1]],
        sets = [1, 3],
        reps = [8, 6],
        intensity = [intensityArb(8), intensityArb(10)],
        roundMode = [ceil, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType[2], setType[2], setType[4]],
        sets = [1, 1, 1],
        reps = [12, 10, 6],
        intensity = [intensityArb(15), intensityArb(18), intensityArb(18)],
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType[2], setType[2], setType[4]],
        sets = [1, 1, 1],
        reps = [10, 10, 5],
        intensity = [intensityArb(12), intensityArb(15), intensityArb(15)],
        roundMode = [ceil, floor, floor],
    ),
]
ProgCAP3BenchT2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Bench T2",
    sessions = 2,
    period = 3,
    setScheme = SetsCAP3BenchT2,
)
calcWeights.(BenchT2, SetsCAP3BenchT2)
###
# Deadlift T1
DeadliftT1 = Exercise(
    name = deadlift[1],
    equipment = equipment[1],
    muscles = [
        muscles[11],
        muscles[10],
        muscles[9],
        muscles[5],
        muscles[4],
        muscles[7],
    ],
    trainingMax = 160,
)
SetsCAP3DeadliftT1 = [
    # Week 1
    SetScheme(
        type = [setType[5], setType[5], setType[5]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [0.74, 0.75, 0.75],
        addWeight = [2.5, 5, 10],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [0.77, 0.77, 0.77],
        addWeight = [5, 7.5, 12.5],
        roundMode = [floor, ceil, ceil],
    ),
]
ProgCAP3DeadliftT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Deadlift T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3DeadliftT1,
)
calcWeights.(DeadliftT1, SetsCAP3DeadliftT1)
# Deadlift T2
DeadliftT2 = Exercise(
    name = deadlift[2],
    equipment = equipment[1],
    muscles = [
        muscles[9],
        muscles[10],
        muscles[11],
        muscles[5],
        muscles[4],
        muscles[7],
    ],
    trainingMax = 140,
)
SetsCAP3DeadliftT2 = [
    # Week 1
    SetScheme(
        type = [setType[1], setType[1], setType[6]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [0.73, 0.74, 0.755],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType[1], setType[1], setType[6]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [0.62, 0.625, 0.65],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [0.68, 0.68, 0.7],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
]
ProgCAP3DeadliftT2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Deadlift T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3DeadliftT2,
)
calcWeights.(DeadliftT2, SetsCAP3DeadliftT2)
###
# Squat T1
SquatT1 = Exercise(
    name = squat[2],
    equipment = equipment[1],
    muscles = [muscles[9], muscles[10], muscles[5], muscles[8]],
    trainingMax = 112.5,
)
SetsCAP3SquatT1 = [
    # Week 1
    SetScheme(
        type = [setType[1], setType[1], setType[6], setType[1]],
        sets = [4, 2, 1, 1],
        reps = [3, 3, 3, 3],
        intensity = [0.77, 0.77, 0.77, 0.77],
        addWeight = [2.5, 7.5, 7.5, 12.5],
        roundMode = [floor, ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType[5], setType[5], setType[5]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [3, 3, 1],
        reps = [4, 4, 4],
        intensity = [0.735, 0.74, 0.755],
        addWeight = [5, 7.5, 10],
        roundMode = [floor, ceil, ceil],
    ),
]
ProgCAP3SquatT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Squat T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3SquatT1,
)
calcWeights.(SquatT1, SetsCAP3SquatT1)
# Squat T2
SquatT2 = Exercise(
    name = squat[3],
    equipment = equipment[1],
    muscles = [muscles[9], muscles[10], muscles[8]],
    trainingMax = 77.5,
)
SetsCAP3SquatT2 = [
    # Week 1
    SetScheme(
        type = [setType[1], setType[1], setType[6]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [0.73, 0.74, 0.755],
        addWeight = [0, 0, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [0.62, 0.625, 0.65],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType[1], setType[1], setType[2]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [0.68, 0.68, 0.7],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
]
ProgCAP3SquatT2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Squat T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3SquatT2,
)
calcWeights.(SquatT2, SetsCAP3SquatT2)
###
days = []
# Day 1
push!(days, BenchT1, ProgCAP3BenchT1, 1)
push!(days, BenchT2, ProgCAP3BenchT2, 1)
# Day 2
push!(days, DeadliftT2, ProgCAP3DeadliftT2, 1)
push!(days, DeadliftT2, ProgCAP3DeadliftT2, 1)
# Day 3
push!(days, SquatT1, ProgCAP3SquatT1, 1)
push!(days, SquatT1, ProgCAP3SquatT1, 1)
# Day 4
push!(days, BenchT1, ProgCAP3BenchT1, 2)
push!(days, BenchT2, ProgCAP3BenchT2, 2)
# Day 5
# push!(days, (name="Rest",))
push!(days, "Rest")
# Day 6
push!(days, DeadliftT1, ProgCAP3DeadliftT1, 1)
push!(days, DeadliftT1, ProgCAP3DeadliftT1, 1)
# Day 7
push!(days, SquatT2, ProgCAP3SquatT2, 1)
push!(days, SquatT2, ProgCAP3SquatT2, 1)

programmes = Dict{Integer, Programme}()
push!(
    programmes,
    1 => Programme(
        "nSuns CAP3",
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
            days[1:2],
            days[3:4],
            days[5:6],
            days[7:8],
            days[9],
            days[10:11],
            days[12:13],
        ],
    ),
)

calcRPE(5,55/72.5)
showDays(programmes[1])
# function intensity2(reps::Integer, rpe::Real = 10)
#     return 1-1/(0.995 + 4.5*rpe/(reps + 10 - rpe) + 0.0025*(reps-1)/reps - 0.2*(reps-1)/rpe)
#     # return 1/(0.995 + 0.0333*(reps + 10 - rpe))
# end

function intensity2(reps::Integer, rpe::Real = 10)
    return 1 / (
        0.995 +
        0.0333 * (reps + 10 - rpe) +
        (reps - 1) * (0.0025 / reps + 0.1 / rpe)
    )
end

calcIntensity(12,6)
calcRPE(12,calcIntensity(12,6))
calcReps(calcIntensity(12,6), 6)

intensity2(12,6)

# for i in range(10, stop=0,step=-0.5)
#     println(i, ", ", intensity2(12,i))
# end
# length(programmes[1].days)
# programmes[1]
# function intensity2(reps::Integer, rpe::Real = 10)
#     den = (0.995 + 0.0333*(reps + 10 - rpe))
#     # den = (0.995 + reps / (3 * rpe))
#     # println(reps/(3*rpe-10))
#     return 1 / den
# end
# # function intensity(reps::Integer, rpe::Real = 10)
# #     return 1 / (0.995 + reps / (3 * rpe))
# # end
#
# intensity2(1,11)
