using Lifting, Revise
include("LiftingDictionaries.jl")

# Bench 1
BenchT1 = Exercise(
    name = bench[1],
    equipment = equipment[1],
    modality = modality[1],
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
# Bench 2
BenchT2 = Exercise(
    name = bench[4],
    equipment = equipment[1],
    modality = modality[1],
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

Programmes = Dict{Integer, Programme}()
push!(
    Programmes,
    1 => Programme(
        "nSuns CAP3",
        [BenchT1, BenchT2],
        [ProgCAP3BenchT1, ProgCAP3BenchT2],
    ),
)

display(Programmes[1])
