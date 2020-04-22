import Base: display

function showDays(programme::Programme)
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

function display(programme::Programme)
    name = programme.name
    exercise = programme.exercise
    progression = programme.progression

    println("="^80)
    println("Programme: ", name, "\n")
    for i = 1:length(exercise)
        modality = exercise[i].modality
        setScheme = progression[i].setScheme
        sessions = progression[i].sessions
        period = progression[i].period
        println("\tExercise: ", exercise[i].name)
        if modality != "Default"
            println("\tModality: ", exercise[i].modality)
            println("\tSize: ", exercise[i].size)
        end
        println("")

        for j1 = 1:period
            for j2 = 1:sessions
                j = (j1 - 1) * sessions + j2
                lst = []
                push!(lst, ["Type: "; setScheme[j].type])
                push!(lst, ["Sets: "; setScheme[j].sets])
                push!(lst, ["Reps: "; setScheme[j].reps])
                push!(lst, ["Wght: "; setScheme[j].wght])
                push!(lst, ["RPE: "; round.(setScheme[j].rpe, digits = 2)])
                print("\t")
                println("Session: $(j1).$(j2)")
                for k = 1:size(lst, 1)
                    print("\t\t")
                    for l = 1:size(lst[k], 1)
                        print(lst[k][l])
                        1 < l < size(lst[k], 1) ? print(", ") : continue
                    end
                    println("")
                end
                println("")
            end
        end
        println("-"^80, "\n")
    end
    println("="^80)
end
