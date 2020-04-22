import Base: display


function display(programme::Programme)
    days = programme.days
    numDays = length(days)

    println("="^80)
    println("Programme: ", programme.name, "\n")
    for i = 1:numDays
        println("\nDay ", i)
        if typeof(days[i]) == String
            println("  ", days[i])
            println("-"^80)
            continue
        end

        numExercises = length(days[i])
        for j = 1:numExercises
            numSets = length(days[i][j].sets)
            println("  Exercise ", j)
            name = days[i][j].name
            type = days[i][j].type
            set = days[i][j].sets
            reps = days[i][j].reps
            wght = days[i][j].wght
            rpe = days[i][j].rpe
            intensity = round.(days[i][j].intensity .* 100, digits = 2)

            print("    ")
            if haskey(days[i][j], :modality)
                print(days[i][j].modality, " ")
            end
            println(name)

            if numSets == 1
                print("      ", set[1], " × ", reps[1], " × ", wght[1], "\t(")
                [print(type[k]) for k = 1:length(type)]
                println(", rpe: ", rpe[1], ", ", intensity[1], "%)")
            else
                for k = 1:numSets
                    println(
                        "      ",
                        set[k],
                        " × ",
                        reps[k],
                        " × ",
                        wght[k],
                        "\t(",
                        type[k],
                        ", rpe: ",
                        rpe[k],
                        ", ",
                        intensity[k],
                        "%)",
                    )
                end
            end
        end
        println("\n", "-"^80)
    end
end
function display(programme::Programme, idx)
    days = programme.days

    println("="^80)
    println("Programme: ", programme.name, "\n")
    for i in idx
        println("\nDay ", i)
        if typeof(days[i]) == String
            println("  ", days[i])
            println("-"^80)
            continue
        end

        numExercises = length(days[i])
        for j = 1:numExercises
            numSets = length(days[i][j].sets)
            println("  Exercise ", j)
            name = days[i][j].name
            type = days[i][j].type
            set = days[i][j].sets
            reps = days[i][j].reps
            wght = days[i][j].wght
            rpe = days[i][j].rpe
            intensity = round.(days[i][j].intensity .* 100, digits = 2)

            print("    ")
            if haskey(days[i][j], :modality)
                print(days[i][j].modality, " ")
            end
            println(name)

            if numSets == 1
                print("      ", set[1], " × ", reps[1], " × ", wght[1], "\t(")
                [print(type[k]) for k = 1:length(type)]
                println(", rpe: ", rpe[1], ", ", intensity[1], "%)")
            else
                for k = 1:numSets
                    println(
                        "      ",
                        set[k],
                        " × ",
                        reps[k],
                        " × ",
                        wght[k],
                        "\t(",
                        type[k],
                        ", rpe: ",
                        rpe[k],
                        ", ",
                        intensity[k],
                        "%)",
                    )
                end
            end
        end
        println("\n", "-"^80)
    end
end
