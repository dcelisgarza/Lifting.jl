"""
```
Lifting_Progressions::Dict{String, Progression}
```
Dictionary with preloaded progressions. These are just the progressions I use in my current programme.

```
julia> import Lifting: Lifting_Progressions
julia> keys(Lifting_Progressions)
Base.KeySet for a Dict{String,Progression} with 14 entries. Keys:
  "AMRAP_Cali"
  "nSuns_6Day_OHP"
  "AMRAP_Grip"
  "l23_lmh"
  "m23_lmh"
  "h23_lmh"
  "CAP3_Bench_T1"
  "CAP3_Row_T1"
  "CAP3_Squat_T2"
  "CAP3_Deadlift_T1"
  "CAP3_Squat_T1"
  "CAP3_Bench_T2"
  "CAP3_Deadlift_T2"
  "CAP3_Row_T2"
```
"""
Lifting_Progressions = Dict{String,Progression}()

## nSuns CAP3
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
CAP3_Bench_T1 = Progression(
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
CAP3_Bench_T2 = Progression(
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
CAP3_Deadlift_T1 = Progression(
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
CAP3_Deadlift_T2 = Progression(
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
CAP3_Squat_T1 = Progression(
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
CAP3_Squat_T2 = Progression(
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
CAP3_Row_T1 = Progression(
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
CAP3_Row_T2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Row T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3RowT2,
)
SetsCAP3OHPT1 = [
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
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [10, 5],
        intensity = intensityArb.([12, 15]),
        roundMode = [ceil, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = intensityArb.([10, 12, 12]),
        roundMode = [ceil, floor, floor],
    ),
]
CAP3_OHP_T1 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 OHP T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3OHPT1,
)
SetsCAP3OHPT2 = [
    # Week 1
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
        reps = [12, 10, 6],
        intensity = intensityArb.([15, 18, 18]),
        roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = intensityArb.([12, 15, 15]),
        roundMode = [ceil, floor, floor],
    ),
]
CAP3_OHP_T2 = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 OHP T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3OHPT2,
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
nSuns_6Day_OHP = Progression(
    type = PeriodProgression(),
    name = "nSuns 6-Day Press T1",
    sessions = 2,
    period = 1,
    setScheme = Sets6DayPressT1,
)

## nSuns-DCG RPE CAP3
SetsCAP3BenchT1_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [4.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [6, 5, 5],
        intensity = [6.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [9, 9, 9],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [5, 6, 7],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
CAP3_Bench_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Bench T1",
    sessions = 2,
    period = 3,
    setScheme = SetsCAP3BenchT1_RPE,
)
SetsCAP3BenchT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [8, 6, 4.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [8.5, 6.5, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [9, 7, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [8, 6],
        intensity = [8.5, 7.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [12, 10, 6],
        intensity = [8, 6.5, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 10, 5],
        intensity = [8, 7, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
CAP3_Bench_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Bench T2",
    sessions = 2,
    period = 3,
    setScheme = SetsCAP3BenchT2_RPE,
)

SetsCAP3DeadliftT1_RPE = [
    # Week 1
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [9, 9, 9],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [5.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [6, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
CAP3_Deadlift_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Deadlift T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3DeadliftT1_RPE,
)
SetsCAP3DeadliftT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [6, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [5, 6, 7],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [5, 7, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
CAP3_Deadlift_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Deadlift T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3DeadliftT2_RPE,
)

SetsCAP3SquatT1_RPE = [
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
        intensity = [5, 6.5, 6.5, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [9, 9, 9],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [3, 3, 1],
        reps = [4, 4, 4],
        intensity = [6, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
CAP3_Squat_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Squat T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3SquatT1_RPE,
)
SetsCAP3SquatT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [5, 4, 4],
        intensity = [5.5, 6.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [5, 6, 7],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [6, 7, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
CAP3_Squat_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Squat T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3SquatT2_RPE,
)

SetsCAP3RowT1_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [12, 10],
        intensity = [7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [8, 7, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [8.5, 7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
CAP3_Row_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Row T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3RowT1_RPE,
)
SetsCAP3RowT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [6, 4, 3],
        intensity = [9, 7, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 6, 5],
        intensity = [8, 6, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 5, 4],
        intensity = [7.5, 6.5, 5.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
CAP3_Row_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 Row T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3RowT2_RPE,
)

SetsCAP3OHPT1_RPE = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [6, 4, 3],
        intensity = [9, 7, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"]],
        sets = [1, 3],
        reps = [10, 5],
        intensity = [7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [8, 7, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
CAP3_OHP_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 OHP T1",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3OHPT1_RPE,
)
SetsCAP3OHPT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [9, 7.5, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [12, 10, 6],
        intensity = [7.5, 6.5, 5.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [8, 6, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
CAP3_OHP_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "nSuns CAP 3 OHP T2",
    sessions = 1,
    period = 3,
    setScheme = SetsCAP3OHPT2_RPE,
)

SetsDCG_CAP3OHPT1_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 3, 1],
        reps = [3, 3, 3],
        intensity = [5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["test"], setType["test"], setType["test"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [9, 9, 9],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [4, 4, 4],
        intensity = [4.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
DCG_CAP3_OHP_T1_RPE = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 3 OHP T1",
    sessions = 1,
    period = 3,
    setScheme = SetsDCG_CAP3OHPT1_RPE,
)

SetsDCG_CAP3OHPT2_RPE = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [5, 2, 1],
        reps = [6, 5, 5],
        intensity = [5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["optional"]],
        sets = [4, 4, 1],
        reps = [6, 5, 5],
        intensity = [6.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["amrap"]],
        sets = [4, 2, 1],
        reps = [8, 6, 6],
        intensity = [5, 6, 7],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
DCG_CAP3_OHP_T2_RPE = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 3 OHP T2",
    sessions = 1,
    period = 3,
    setScheme = SetsDCG_CAP3OHPT2_RPE,
)

## Accessories
# Low, mid, high reps.
# High intensity burnout.
H1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [4, 6, 3],
    intensity = [9.5, 8, 5.5],
    roundMode = [ceil, ceil, ceil],
    rpeMode = true,
)
H2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [6, 8, 4],
    intensity = [9.5, 8, 5.5],
    roundMode = [ceil, ceil, ceil],
    rpeMode = true,
)
H3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [8, 10, 6],
    intensity = [9.5, 8, 5.5],
    roundMode = [ceil, ceil, ceil],
    rpeMode = true,
)
H4 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [10, 12, 8],
    intensity = [9.5, 8, 5.5],
    roundMode = [ceil, ceil, ceil],
    rpeMode = true,
)

# Mid intensity burnout.
M1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [6, 8, 4],
    intensity = [8.5, 7, 4.5],
    roundMode = [ceil, ceil, floor],
    rpeMode = true,
)
M2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [8, 10, 6],
    intensity = [8.5, 7, 4.5],
    roundMode = [ceil, ceil, floor],
    rpeMode = true,
)
M3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [10, 12, 8],
    intensity = [8.5, 7, 4.5],
    roundMode = [ceil, ceil, floor],
    rpeMode = true,
)
M4 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [12, 14, 10],
    intensity = [8.5, 7, 4.5],
    roundMode = [ceil, ceil, floor],
    rpeMode = true,
)

# Low intensity burnout.
L1 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [8, 10, 6],
    intensity = [7.5, 6, 3.5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
L2 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [10, 12, 8],
    intensity = [7.5, 6, 3.5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
L3 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [12, 14, 10],
    intensity = [7.5, 6, 3.5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)
L4 = SetScheme(
    type = [setType["amrap"], setType["amrap"], setType["opt amrap emom"]],
    sets = [1, 2, 1],
    reps = [14, 16, 12],
    intensity = [7.5, 6, 3.5],
    roundMode = [ceil, floor, floor],
    rpeMode = true,
)

# Deload
D1 = SetScheme(
    type = setType["amrap"],
    sets = 3,
    reps = 6,
    intensity = 3,
    rpeMode = true,
)
D2 = SetScheme(
    type = setType["amrap"],
    sets = 3,
    reps = 8,
    intensity = 3,
    rpeMode = true,
)
D3 = SetScheme(
    type = setType["amrap"],
    sets = 3,
    reps = 10,
    intensity = 3,
    rpeMode = true,
)
D4 = SetScheme(
    type = setType["amrap"],
    sets = 3,
    reps = 12,
    intensity = 3,
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

h_lmhd = Progression(
    type = PeriodProgression(),
    name = "Low Rep LMHD",
    sessions = 1,
    period = 4,
    setScheme = [L1, M1, H1, D1],
)
m_lmhd = Progression(
    type = PeriodProgression(),
    name = "Mid Rep LMHD",
    sessions = 1,
    period = 4,
    setScheme = [L2, M2, H2, D2],
)
l_lmhd = Progression(
    type = PeriodProgression(),
    name = "High Rep LMHD",
    sessions = 1,
    period = 4,
    setScheme = [L3, M3, H3, D3],
)

# Calisthenics.
calisthenics = SetScheme(; type = setType["amrap"], sets = 5, reps = 12, intensity = 0.8)
AMRAP_Cali = Progression(
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
AMRAP_Grip = Progression(
    type = LinearProgression(),
    name = "Grip AMRAP",
    sessions = 1,
    period = 1,
    setScheme = gripAMRAP,
)

push!(Lifting_Progressions, "CAP3_Bench_T1" => CAP3_Bench_T1)
push!(Lifting_Progressions, "CAP3_Bench_T2" => CAP3_Bench_T2)
push!(Lifting_Progressions, "CAP3_Deadlift_T1" => CAP3_Deadlift_T1)
push!(Lifting_Progressions, "CAP3_Deadlift_T2" => CAP3_Deadlift_T2)
push!(Lifting_Progressions, "CAP3_Squat_T1" => CAP3_Squat_T1)
push!(Lifting_Progressions, "CAP3_Squat_T2" => CAP3_Squat_T2)
push!(Lifting_Progressions, "CAP3_Row_T1" => CAP3_Row_T1)
push!(Lifting_Progressions, "CAP3_Row_T2" => CAP3_Row_T2)
push!(Lifting_Progressions, "CAP3_OHP_T1" => CAP3_OHP_T1)
push!(Lifting_Progressions, "CAP3_OHP_T2" => CAP3_OHP_T2)
push!(Lifting_Progressions, "nSuns_6Day_OHP" => nSuns_6Day_OHP)
push!(Lifting_Progressions, "h23_lmh" => h23_lmh)
push!(Lifting_Progressions, "m23_lmh" => m23_lmh)
push!(Lifting_Progressions, "l23_lmh" => l23_lmh)
push!(Lifting_Progressions, "h_lmhd" => h_lmhd)
push!(Lifting_Progressions, "m_lmhd" => m_lmhd)
push!(Lifting_Progressions, "l_lmhd" => l_lmhd)
push!(Lifting_Progressions, "AMRAP_Cali" => AMRAP_Cali)
push!(Lifting_Progressions, "AMRAP_Grip" => AMRAP_Grip)
push!(Lifting_Progressions, "CAP3_Bench_T1_RPE" => CAP3_Bench_T1)
push!(Lifting_Progressions, "CAP3_Bench_T2_RPE" => CAP3_Bench_T2)
push!(Lifting_Progressions, "CAP3_Deadlift_T1_RPE" => CAP3_Deadlift_T1)
push!(Lifting_Progressions, "CAP3_Deadlift_T2_RPE" => CAP3_Deadlift_T2)
push!(Lifting_Progressions, "CAP3_Squat_T1_RPE" => CAP3_Squat_T1)
push!(Lifting_Progressions, "CAP3_Squat_T2_RPE" => CAP3_Squat_T2)
push!(Lifting_Progressions, "CAP3_Row_T1_RPE" => CAP3_Row_T1)
push!(Lifting_Progressions, "CAP3_Row_T2_RPE" => CAP3_Row_T2)
push!(Lifting_Progressions, "CAP3_OHP_T1_RPE" => CAP3_OHP_T1)
push!(Lifting_Progressions, "CAP3_OHP_T2_RPE" => CAP3_OHP_T2)
push!(Lifting_Progressions, "DCG_CAP3_OHP_T1_RPE" => DCG_CAP3_OHP_T1_RPE)
push!(Lifting_Progressions, "DCG_CAP3_OHP_T2_RPE" => DCG_CAP3_OHP_T2_RPE)

## Custom programme: 9 week, 4 week hypertrophy, 4 week strength, 1 week test

# Hypertrophy
HyperDCG11 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1],
    reps = [16, 14, 12],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
HyperDCG12 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1],
    reps = [16, 14, 12],
    intensity = [8, 8, 8],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
HyperDCG13 = SetScheme(
    type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1, 1],
    reps = [12, 10, 8, 8],
    intensity = [7, 7, 7, 7],
    roundMode = [floor, floor, floor, floor],
    rpeMode = true,
)
HyperDCG14 = SetScheme(
    type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1, 1],
    reps = [12, 10, 8, 8],
    intensity = [8, 8, 8, 8],
    roundMode = [floor, floor, floor, floor],
    rpeMode = true,
)

HyperDCG21 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1],
    reps = [16, 14, 12],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
HyperDCG22 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1],
    reps = [16, 14, 12],
    intensity = [6, 6, 6],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
HyperDCG23 = SetScheme(
    type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1, 1],
    reps = [12, 10, 8, 8],
    intensity = [7, 7, 7, 7],
    roundMode = [floor, floor, floor, floor],
    rpeMode = true,
)
HyperDCG24 = SetScheme(
    type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
    sets = [1, 1, 1, 1],
    reps = [12, 10, 8, 8],
    intensity = [6, 6, 6, 6],
    roundMode = [floor, floor, floor, floor],
    rpeMode = true,
)

# Strength
StrenDCG11 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [2, 2, 1],
    reps = [8, 6, 4],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG12 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [2, 2, 1],
    reps = [8, 6, 4],
    intensity = [8, 8, 8],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG13 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [3, 2, 1],
    reps = [6, 4, 2],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG14 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [3, 2, 1],
    reps = [6, 4, 2],
    intensity = [8, 8, 8],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)

StrenDCG21 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [2, 2, 1],
    reps = [8, 6, 4],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG22 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [2, 2, 1],
    reps = [8, 6, 4],
    intensity = [6, 6, 6],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG23 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [3, 2, 1],
    reps = [6, 4, 2],
    intensity = [7, 7, 7],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)
StrenDCG24 = SetScheme(
    type = [setType["default"], setType["default"], setType["amrap"]],
    sets = [3, 2, 1],
    reps = [6, 4, 2],
    intensity = [6, 6, 6],
    roundMode = [floor, floor, floor],
    rpeMode = true,
)

# Test
TestDCG1 = SetScheme(
    type = [
        setType["default"],
        setType["default"],
        setType["test"],
        setType["default"],
        setType["default"],
    ],
    sets = [1, 1, 1, 1, 1],
    reps = [5, 3, 1, 5, 8],
    intensity = [7, 8, 9, 8, 7],
    roundMode = [floor, floor, floor, floor, floor],
    rpeMode = true,
)
TestDCG2 = SetScheme(
    type = [
        setType["default"],
        setType["default"],
        setType["test"],
        setType["default"],
        setType["default"],
    ],
    sets = [1, 1, 1, 1, 1],
    reps = [5, 3, 1, 5, 8],
    intensity = [6, 7, 8, 7, 6],
    roundMode = [floor, floor, floor, floor, floor],
    rpeMode = true,
)

# Progression
DCGYugeStrT1 = Progression(
    type = BlockProgression(),
    name = "Yuge & Strong T1",
    sessions = 1,
    period = 9,
    setScheme = [
        HyperDCG11,
        HyperDCG12,
        HyperDCG13,
        HyperDCG14,
        StrenDCG11,
        StrenDCG12,
        StrenDCG13,
        StrenDCG14,
        TestDCG1,
    ],
)
DCGYugeStrT2 = Progression(
    type = BlockProgression(),
    name = "Yuge & Strong T2",
    sessions = 1,
    period = 9,
    setScheme = [
        HyperDCG21,
        HyperDCG22,
        HyperDCG23,
        HyperDCG24,
        StrenDCG21,
        StrenDCG22,
        StrenDCG23,
        StrenDCG24,
        TestDCG2,
    ],
)
DCGYugeStrT3 = Progression(
    type = BlockProgression(),
    name = "Yuge & Strong T3",
    sessions = 1,
    period = 9,
    setScheme = [L3, M3, H3, L2, M2, H2, L1, M1, H1],
)
DCGYugeStrT4 = Progression(
    type = BlockProgression(),
    name = "Yuge & Strong T4",
    sessions = 1,
    period = 9,
    setScheme = [L4, M4, H4, L3, M3, H3, L2, M2, H2],
)
push!(Lifting_Progressions, "DCGYugeStrT1" => DCGYugeStrT1)
push!(Lifting_Progressions, "DCGYugeStrT2" => DCGYugeStrT2)
push!(Lifting_Progressions, "DCGYugeStrT3" => DCGYugeStrT3)
push!(Lifting_Progressions, "DCGYugeStrT4" => DCGYugeStrT4)

## DCG_CAP4
Sets_DCG_CAP4_Deadlift_T1 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["test"], setType["test"], setType["test"], setType["default"], setType["amrap"]],
        sets = [1, 1, 1, 1, 1, 1, 1, 1],
        reps = [3, 5, 1, 6, 4, 2, 3, 8],
        intensity = [0.14, 0.76, -5.32, 9, 9, 9, 1.312, 1.54],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 1,
        rpeMode = true,
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [4, 4, 4, 4],
        intensity = [4, 5, 6, 7],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 2, 1, 1],
        reps = [3, 3, 3, 3, 3],
        intensity = [5, 6, 7, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
DCG_CAP4_Deadlift_T1 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Deadlift T1",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Deadlift_T1,
)
Sets_DCG_CAP4_Deadlift_T2 = [
    # Week 1
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 0.5,
        rpeMode = true,
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [8, 8, 6, 6],
        intensity = [3.5, 4.5, 5.5, 6.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["opt amrap"]],
        sets = [2, 3, 2, 1],
        reps = [6, 6, 5, 5],
        intensity = [4.5, 5.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 3, 1, 1],
        reps = [5, 5, 4, 4, 4],
        intensity = [5.5, 6.5, 7.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
DCG_CAP4_Deadlift_T2 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Deadlift T2",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Deadlift_T2,
)

Sets_DCG_CAP4_Row_T1 = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [6, 4, 3],
        intensity = [8, 7, 6],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 1,
        rpeMode = true,
    ),
    # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 6, 5],
        intensity = [6, 5, 4],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 4
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 5, 4],
        intensity = [7, 6, 5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
DCG_CAP4_Row_T1 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Row T1",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Row_T1,
)
Sets_DCG_CAP4_Row_T2 = [
    # Week 1
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 0.5,
        rpeMode = true,
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap"]],
        sets = [1, 1, 1],
        reps = [12, 10, 8],
        intensity = [6.5, 5.5, 4.5],
        rpeMode = true,
        # roundMode = [ceil, floor],
    ),
     # Week 3
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 5],
        intensity = [7.5, 6.5, 5.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 4
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [8.5, 7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ), 
]
DCG_CAP4_Row_T2 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Row T2",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Row_T2,
)

Sets_DCG_CAP4_Squat_T1 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 2, 1, 1],
        reps = [3, 3, 3, 3, 3],
        intensity = [5, 6, 7, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["test"], setType["test"], setType["test"], setType["default"], setType["amrap"]],
        sets = [1, 1, 1, 1, 1, 1, 1, 1],
        reps = [3, 5, 1, 6, 4, 2, 3, 8],
        intensity = [0.14, 0.76, -5.32, 9, 9, 9, 1.312, 1.54],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 1,
        rpeMode = true,
    ),
    # Week 4
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [4, 4, 4, 4],
        intensity = [4, 5, 6, 7],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
]
DCG_CAP4_Squat_T1 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Squat T1",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Squat_T1,
)
Sets_DCG_CAP4_Squat_T2 = [
     # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 3, 1, 1],
        reps = [5, 5, 4, 4, 4],
        intensity = [5.5, 6.5, 7.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 0.5,
        rpeMode = true,
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [8, 8, 6, 6],
        intensity = [3.5, 4.5, 5.5, 6.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["opt amrap"]],
        sets = [2, 3, 2, 1],
        reps = [6, 6, 5, 5],
        intensity = [4.5, 5.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
]
DCG_CAP4_Squat_T2 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Squat T2",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_Squat_T2,
)

Sets_DCG_CAP4_Bench_T1 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [4, 4, 4, 4],
        intensity = [4, 5, 6, 7],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 3, 2, 1],
        reps = [6, 6, 5, 5],
        intensity = [3.5, 4.5, 5.5, 6.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 2, 1, 1],
        reps = [3, 3, 3, 3, 3],
        intensity = [5, 6, 7, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 3, 1, 1],
        reps = [5, 5, 4, 4, 4],
        intensity = [4.5, 5.5, 6.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["test"], setType["test"], setType["test"], setType["default"], setType["amrap"]],
        sets = [1, 1, 1, 1, 1, 1, 1, 1],
        reps = [3, 5, 1, 6, 4, 2, 3, 8],
        intensity = [0.14, 0.76, -5.32, 9, 9, 9, 1.312, 1.54],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [8, 8, 6, 6],
        intensity = [5.5, 6.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = setType["default"],
        sets = 4,
        reps = 8,
        intensity = 1,
        rpeMode = true,
    ),
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 1,
        rpeMode = true,
    ),
]
DCG_CAP4_Bench_T1 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Bench T1",
    sessions = 2,
    period = 4,
    setScheme = Sets_DCG_CAP4_Bench_T1,
)
Sets_DCG_CAP4_Bench_T2 = [
    # Week 1
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 6],
        intensity = [7.5, 6.5, 5.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [7.5, 6.5, 5.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 2
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [8, 6, 4],
        intensity = [8.5, 7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [6, 4, 2],
        intensity = [8.5, 7.5, 6.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    # Week 3
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 0.5,
        rpeMode = true,
    ),
   SetScheme(
        type = setType["default"],
        sets = 4,
        reps = 8,
        intensity = 0.5,
        rpeMode = true,
    ),
    # Week 4
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [12, 10, 6],
        intensity = [6.5, 5.5, 4.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
    SetScheme(
        type = [setType["amrap"], setType["amrap"], setType["amrap emom"]],
        sets = [1, 1, 1],
        reps = [10, 8, 4],
        intensity = [6.5, 5.5, 4.5],
        rpeMode = true,
        # roundMode = [ceil, floor, floor],
    ),
]
DCG_CAP4_Bench_T2 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 Bench T2",
    sessions = 2,
    period = 4,
    setScheme = Sets_DCG_CAP4_Bench_T2,
)

Sets_DCG_CAP4_OHP_T1 = [
    # Week 1
    SetScheme(
        type = setType["default"],
        sets = 4,
        reps = 8,
        intensity = 1,
        rpeMode = true,
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [4, 4, 4, 4],
        intensity = [4, 5, 6, 7],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 2, 1, 1],
        reps = [3, 3, 3, 3, 3],
        intensity = [5, 6, 7, 7, 8],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["test"], setType["test"], setType["test"], setType["default"], setType["amrap"]],
        sets = [1, 1, 1, 1, 1, 1, 1, 1],
        reps = [3, 5, 1, 6, 4, 2, 3, 8],
        intensity = [0.14, 0.76, -5.32, 9, 9, 9, 1.312, 1.54],
        rpeMode = true,
        # roundMode = [ceil, ceil, ceil],
    ),
]
DCG_CAP4_OHP_T1 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 OHP T1",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_OHP_T1,
)
Sets_DCG_CAP4_OHP_T2 = [
    # Week 1
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 3, 2, 1],
        reps = [10, 10, 8, 8],
        intensity = [3.5, 4.5, 5.5, 6.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 2
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["optional"], setType["amrap"]],
        sets = [2, 2, 3, 1, 1],
        reps = [8, 8, 6, 6, 6],
        intensity = [4.5, 5.5, 6.5, 6.5, 7.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 3
    SetScheme(
        type = [setType["default"], setType["default"], setType["default"], setType["amrap"]],
        sets = [2, 2, 2, 1],
        reps = [6, 6, 4, 4],
        intensity = [5.5, 6.5, 7.5, 8.5],
        rpeMode = true,
        # roundMode = [floor, ceil, ceil],
    ),
    # Week 4
    SetScheme(
        type = setType["default"],
        sets = 3,
        reps = 10,
        intensity = 1,
        rpeMode = true,
    ),
]
DCG_CAP4_OHP_T2 = Progression(
    type = PeriodProgression(),
    name = "DCG CAP 4 OHP T2",
    sessions = 1,
    period = 4,
    setScheme = Sets_DCG_CAP4_OHP_T2,
)

push!(Lifting_Progressions, "DCG_CAP4_Bench_T1" => DCG_CAP4_Bench_T1)
push!(Lifting_Progressions, "DCG_CAP4_Bench_T2" => DCG_CAP4_Bench_T2)
push!(Lifting_Progressions, "DCG_CAP4_Deadlift_T1" => DCG_CAP4_Deadlift_T1)
push!(Lifting_Progressions, "DCG_CAP4_Deadlift_T2" => DCG_CAP4_Deadlift_T2)
push!(Lifting_Progressions, "DCG_CAP4_Squat_T1" => DCG_CAP4_Squat_T1)
push!(Lifting_Progressions, "DCG_CAP4_Squat_T2" => DCG_CAP4_Squat_T2)
push!(Lifting_Progressions, "DCG_CAP4_Row_T1" => DCG_CAP4_Row_T1)
push!(Lifting_Progressions, "DCG_CAP4_Row_T2" => DCG_CAP4_Row_T2)
push!(Lifting_Progressions, "DCG_CAP4_OHP_T1" => DCG_CAP4_OHP_T1)
push!(Lifting_Progressions, "DCG_CAP4_OHP_T2" => DCG_CAP4_OHP_T2)
