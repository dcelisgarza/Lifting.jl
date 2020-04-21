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
Sets6DayPressT1 = [
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
Prog6DayPressT1 = Progression(
    type = PeriodProgression(),
    name = "nSuns 6-Day Press T1",
    sessions = 2,
    period = 1,
    setScheme = Sets6DayPressT1,
)

### Accessories
# Low, mid, high reps.
# High intensity burnout.
H1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [4, 6, 3],
    intensity = [9, 8, 7],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
H2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [6, 8, 4],
    intensity = [9, 8, 7],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
H3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 6],
    intensity = [9, 8, 7],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
# Mid intensity burnout.
M1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [6, 8, 4],
    intensity = [8, 7, 6],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
M2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 6],
    intensity = [8, 7, 6],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
M3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [10, 12, 8],
    intensity = [8, 7, 6],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
# Low intensity burnout.
L1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [8, 10, 6],
    intensity = [7, 6, 5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
L2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [10, 12, 8],
    intensity = [7, 6, 5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
L3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
    sets = [1, 3, 1],
    reps = [12, 14, 10],
    intensity = [7, 6, 5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
h23_lmh = Progression(
    type = PeriodProgression(),
    name = "Low Rep LMH",
    sessions = 1,
    period = 3,
    setScheme = [L1, M1, H1],
)
m23_lmh = Progression(
    type = PeriodProgression(),
    name = "Mid Rep LMH",
    sessions = 1,
    period = 3,
    setScheme = [L2, M2, H2],
)
l23_lmh = Progression(
    type = PeriodProgression(),
    name = "High Rep LMH",
    sessions = 1,
    period = 3,
    setScheme = [L3, M3, H3],
)

# Calisthenics.
calisthenics = SetScheme(;
    type = setType["amrap"],
    sets = 5,
    reps = 12,
    intensity = 10,
    rpeMode = true,
)
ProgCali = Progression(
    type = LinearProgression(),
    name = "Calisthenics AMRAP",
    sessions = 1,
    period = 1,
    setScheme = calisthenics,
)

# Grip amrap
gripAMRAP = SetScheme(;
    type = setType["amrap"],
    sets = 4,
    reps = 15,
    intensity = 10,
    rpeMode = true,
    roundMode = ceil,
)
ProgGrip = Progression(
    type = LinearProgression(),
    name = "Grip AMRAP",
    sessions = 1,
    period = 1,
    setScheme = gripAMRAP,
)
