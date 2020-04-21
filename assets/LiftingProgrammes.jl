using Lifting, Revise
include("LiftingDictionaries.jl")

###
# Bench 1
BenchT1 = Exercise(
    name = bench["flat"],
    equipment = equipment["bb"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 92.5,
)
SetsCAP3BenchT1 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [0.735, 0.735, 0.735],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [0.68, 0.68, 0.71],
        addWeight = [0, 5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [0.77, 0.77, 0.77],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [6, 5, 5],
        intensity = [0.725, 0.74, 0.755],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        addWeight = [0, 0, 0],
        roundMode = [ceil, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
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
    name = bench["cg"],
    equipment = equipment["bb"],
    muscles = [muscles["pecs"], muscles["triceps"], muscles["front delts"]],
    trainingMax = 75,
)
SetsCAP3BenchT2 = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = intensityArb.([12, 15, 15]),
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = intensityArb.([10, 12, 12]),
        roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = intensityArb.([10, 12, 12]),
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [8, 6],
        intensity = intensityArb.([8, 10]),
        roundMode = [ceil, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [12, 10, 6],
        intensity = intensityArb.([15, 18, 18]),
        roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 10, 5],
        intensity = intensityArb.([12, 15, 15]),
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
SetsCAP3DeadliftT1 = [
    # Week 1
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [0.74, 0.75, 0.75],
        addWeight = [2.5, 5, 10],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
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
SetsCAP3DeadliftT2 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [0.73, 0.74, 0.755],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [0.62, 0.625, 0.65],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
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
SetsCAP3SquatT1 = [
    # Week 1
    SetScheme(
        type = [
            setType["default"],
            setType["default"],
            setType["optional"],
            setType["default"],
        ],
        sets = [4, 2, 1, 1],
        reps = [3, 3, 3, 3],
        intensity = [0.77, 0.77, 0.77, 0.77],
        addWeight = [2.5, 7.5, 7.5, 12.5],
        roundMode = [floor, ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [0.795, 0.835, 0.885],
        roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
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
    name = squat["front"],
    equipment = equipment["bb"],
    muscles = [muscles["quads"], muscles["glutes"], muscles["core"]],
    trainingMax = 77.5,
)
SetsCAP3SquatT2 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [0.73, 0.74, 0.755],
        addWeight = [0, 0, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [0.62, 0.625, 0.65],
        addWeight = [0, 2.5, 5],
        roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
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
# Row T1
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
SetsCAP3RowT1 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [12, 10],
        intensity = intensityArb.([15, 18]),
        roundMode = [ceil, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = intensityArb.([10, 12, 12]),
        roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = intensityArb.([12, 15, 15]),
        roundMode = [ceil, floor, floor],
    ),
]
ProgCAP3RowT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Row T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3RowT1,
)
calcWeights.(RowT1, SetsCAP3RowT1)
# Row T2
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
SetsCAP3RowT2 = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [6, 4, 3],
        intensity = intensityArb.([8, 10, 10]),
        roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 6, 5],
        intensity = intensityArb.([12, 15, 15]),
        roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 5, 4],
        intensity = intensityArb.([10, 12, 12]),
        roundMode = [ceil, floor, floor],
    ),
]
ProgCAP3RowT2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Row T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3RowT2,
)
calcWeights.(RowT2, SetsCAP3RowT2)

###
# Press T1
PressT1 = Exercise(
    name = press["ohp"],
    equipment = equipment["bb"],
    muscles = [muscles["front delts"], muscles["triceps"], muscles["traps"]],
    trainingMax = 57.5,
)
nSuns6DayPressT1 = [
    # Session 1
    SetScheme(
        type = [
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
        ],
        sets = [1, 1, 1, 1, 1, 1, 1, 1],
        reps = [6, 5, 3, 5, 7, 4, 6, 8],
        intensity = [0.5, 0.6, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7],
        roundMode = [ceil, ceil, ceil, ceil, ceil, ceil, ceil, ceil],
    ),
    # Session 2
    SetScheme(
        type = [
            setType["default"],
            setType["default"],
            setType["test"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["default"],
            setType["amrap"],
        ],
        sets = [1, 1, 1, 1, 1, 1, 1, 1, 1],
        reps = [5, 5, 1, 3, 3, 3, 5, 5, 5],
        intensity = [0.75, 0.85, 0.95, 0.9, 0.85, 0.8, 0.75, 0.7, 0.65],
        roundMode = [ceil, ceil, ceil, ceil, ceil, ceil, ceil, ceil, ceil],
    ),
]
ProgCAP3PressT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns 6-Day Press T1",
    sessions = 2,
    period = 1,
    setScheme = nSuns6DayPressT1,
)
calcWeights.(PressT1, nSuns6DayPressT1)

###
H1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [4, 6, 3],
    intensity = [10, 8, 3],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

H2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [6, 8, 4],
    intensity = [10, 8, 3],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

H3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 6],
    intensity = [10, 8, 3],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

###
M1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [6, 8, 4],
    intensity = [8, 6, 2],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

M2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 6],
    intensity = [8, 6, 2],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

M3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [10, 12, 8],
    intensity = [8, 6, 2],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

###
L1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 12],
    intensity = [6, 4, 1],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

L2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [10, 12, 8],
    intensity = [6, 4, 1],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

L3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [12, 14, 10],
    intensity = [6, 4, 1],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

###
days = []
# Day 1
push!(days, BenchT1, ProgCAP3BenchT1, 1)
push!(days, BenchT2, ProgCAP3BenchT2, 1)
# Day 2
push!(days, DeadliftT2, ProgCAP3DeadliftT2, 1)
push!(days, RowT2, ProgCAP3RowT2, 1)
# Day 3
push!(days, SquatT1, ProgCAP3SquatT1, 1)
push!(days, PressT1, ProgCAP3PressT1, 1)
# Day 4
push!(days, BenchT1, ProgCAP3BenchT1, 2)
push!(days, BenchT2, ProgCAP3BenchT2, 2)
# Day 5
push!(days, "Rest")

# Day 6
push!(days, DeadliftT1, ProgCAP3DeadliftT1, 1)
push!(days, RowT1, ProgCAP3RowT1, 1)
# Day 7
push!(days, SquatT2, ProgCAP3SquatT2, 1)
push!(days, PressT1, ProgCAP3PressT1, 2)
# Day 8
push!(days, BenchT1, ProgCAP3BenchT1, 3)
push!(days, BenchT2, ProgCAP3BenchT2, 3)
# Day 9
push!(days, DeadliftT2, ProgCAP3DeadliftT2, 2)
push!(days, RowT2, ProgCAP3RowT2, 2)
# Day 10
push!(days, "Rest")

# Day 11
push!(days, SquatT1, ProgCAP3SquatT1, 2)
push!(days, PressT1, ProgCAP3PressT1, 1)
# Day 12
push!(days, BenchT1, ProgCAP3BenchT1, 4)
push!(days, BenchT2, ProgCAP3BenchT2, 4)
# Day 13
push!(days, DeadliftT1, ProgCAP3DeadliftT1, 2)
push!(days, RowT1, ProgCAP3RowT1, 2)
# Day 14
push!(days, SquatT2, ProgCAP3SquatT2, 2)
push!(days, PressT1, ProgCAP3PressT1, 2)
# Day 15
push!(days, "Rest")

# Day 16
push!(days, BenchT1, ProgCAP3BenchT1, 5)
push!(days, BenchT2, ProgCAP3BenchT2, 5)
# Day 17
push!(days, DeadliftT2, ProgCAP3DeadliftT2, 3)
push!(days, RowT2, ProgCAP3RowT2, 3)
# Day 18
push!(days, SquatT1, ProgCAP3SquatT1, 3)
push!(days, PressT1, ProgCAP3PressT1, 1)
# Day 19
push!(days, BenchT1, ProgCAP3BenchT1, 6)
push!(days, BenchT2, ProgCAP3BenchT2, 6)

# Day 20
push!(days, "Rest")
# Day 21
push!(days, DeadliftT1, ProgCAP3DeadliftT1, 3)
push!(days, RowT1, ProgCAP3RowT1, 3)
# Day 22
push!(days, SquatT2, ProgCAP3SquatT2, 3)
push!(days, PressT1, ProgCAP3PressT1, 2)
# Day 23
push!(days, "Rest")

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
            days[1:2],
            days[3:4],
            days[5:6],
            days[7:8],
            days[9],    # Rest
            days[10:11],
            days[12:13],
            days[14:15],
            days[16:17],
            days[18],   # Rest
            days[19:20],
            days[21:22],
            days[23:24],
            days[25:26],
            days[27],
            days[28:29],
            days[30:31],
            days[32:33],
            days[34:35],
            days[36],   # Rest
            days[37:38],
            days[39:40],
            days[41],   # Rest
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
