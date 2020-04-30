using Lifting
using Test
cd(@__DIR__)

@testset "Struct" begin
    SampleExercise = Exercise(;
        name = "Swiss Bar Bench",
        modality = ["Block", "Semi-Supinated"],
        equipment = "Swiss Bar",
        size = "1 inch",
        muscles = ["Pecs", "Triceps", "Front Delts"],
        trainingMax = 100,
        roundBase = 2.5,
        roundMode = floor,
    )
    @test SampleExercise == SampleExercise[1]
    @test length(SampleExercise) == 1
    for i in SampleExercise
        @test SampleExercise == i
    end

    SampleExercise2 = Exercise(;
        name = "Squat",
        trainingMax = 130,
        roundBase = 2.5,
        roundMode = floor,
    )
    @test SampleExercise.name == "Swiss Bar Bench"
    @test SampleExercise.modality == ["Block", "Semi-Supinated"]
    @test SampleExercise.equipment == "Swiss Bar"
    @test SampleExercise.size == "1 inch"
    @test SampleExercise.muscles == ["Pecs", "Triceps", "Front Delts"]
    @test SampleExercise.trainingMax == 100
    @test SampleExercise.roundBase == 2.5
    @test SampleExercise.roundMode == floor

    SampleScheme = SetScheme(;
        type = ["Long Rest", "Longer Rest", "Longest Rest"],
        sets = [1, 2, 1],
        reps = [12, 14, 10],
        intensity = [7, 8.5, 9.5],
        roundMode = [floor, floor, ceil],
        rpeMode = true,
    )
    SampleScheme2 = SetScheme(;
        type = ["Long Rest", "Longer Rest", "Longest Rest"],
        sets = [1, 2, 1],
        reps = [12, 14, 10],
        intensity = [7, 8.5, 9.5],
        roundMode = [floor, floor, ceil],
        rpeMode = true,
    )
    @test SampleScheme.type == ["Long Rest", "Longer Rest", "Longest Rest"]
    @test SampleScheme.sets == [1, 2, 1]
    @test SampleScheme.reps == [12, 14, 10]
    @test SampleScheme.intensity ==
          [0.6046188561906853, 0.6000914761292184, 0.6936559685445272]
    @test SampleScheme.roundMode == [floor, floor, ceil]
    @test SampleScheme.rpeMode == true
    @test SampleScheme.addWeight == [0, 0, 0]
    @test SampleScheme.wght == [0, 0, 0]

    SampleScheme = SetScheme(;
        type = ["Long Rest", "Longer Rest", "Longest Rest"],
        sets = [1, 2, 1],
        reps = [12, 14, 10],
        intensity = [0.7, 0.65, 0.75],
        addWeight = [2.5, 5, 0],
    )
    @test SampleScheme.intensity == [0.7, 0.65, 0.75]
    @test SampleScheme.roundMode == [floor, floor, floor]
    @test SampleScheme.rpeMode == false
    @test SampleScheme.wght == [0, 0, 0]
    for i in SampleScheme
        @test SampleScheme == i
    end

    SampleProgression = Progression(;
        type = LinearProgression(),
        name = "Progression Name",
        setScheme = SampleScheme,
    )
    @test SampleProgression == SampleProgression[1]
    @test length(SampleProgression) == 1
    for i in SampleProgression
        @test SampleProgression == i
    end

    SampleProgression2 = Progression(;
        type = LinearProgression(),
        name = "Progression Name",
        sessions = 1,
        period = 2,
        setScheme = [deepcopy(SampleScheme), SampleScheme2],
    )

    @test SampleProgression.type == LinearProgression()
    @test SampleProgression.name == "Progression Name"
    @test SampleProgression.setScheme == SampleScheme

    calcWeights(SampleExercise, SampleProgression)
    calcWeights(SampleExercise2, SampleProgression2)
    @test SampleProgression.setScheme.wght ==
          100 * [0.7, 0.65, 0.75] + [2.5, 5, 0]

    struct SampleProgramme <: AbstractProgramme end
    exerProg = Dict()
    push!(
        exerProg,
        "SampleExercise" =>
            (exercise = SampleExercise, progression = SampleProgression),
    )
    push!(
        exerProg,
        "SampleExercise2" =>
            (exercise = SampleExercise2, progression = SampleProgression2),
    )

    function makeDays(::SampleProgramme, exerProg)
        week = [[], [], [], [], [], [], []]
        SampleExercise = exerProg["SampleExercise"].exercise
        SampleProgression = exerProg["SampleExercise"].progression
        push!(week[1], SampleExercise, SampleProgression)   # Day 1
        push!(week[1], SampleExercise, SampleProgression)   # Day 1
        insert!(week[1], 1, SampleExercise2, SampleProgression2)   # Day 1
        push!(week[2], "Rest")  # Day 2
        push!(week[3], SampleExercise, SampleProgression)   # Day 3
        push!(week[4], "Rest")  # Day 4
        push!(week[5], SampleExercise, SampleProgression)   # Day 5
        push!(week[5], "Rest")  # Day 6
        push!(week[7], "Rest")  # Day 7
        return week
    end

    week = makeDays(SampleProgramme(), exerProg)
    sampleProgramme =
        Programme(SampleProgramme(), "SampleProgramme", exerProg, week)
    @test sampleProgramme.type == SampleProgramme()
    @test sampleProgramme.name == "SampleProgramme"
    @test sampleProgramme.exerProg == exerProg
    @test sampleProgramme.days == week
    test = []
    push!(test, SampleExercise2, SampleProgression2)
    @test week[1][1] == test[1]
    @test sampleProgramme[1] == sampleProgramme.days[1]
    @test sampleProgramme[1:2:3] == [sampleProgramme.days[1], sampleProgramme.days[3]]
end
