import Base: display

function showDays(programme::Programme)
    days = programme.days
    numDays = length(days)

    println("="^80)
    println("Programme: ", programme.name, "\n")
    for i in 1:numDays
        println("Day ", i)
        if typeof(days[i]) == String
            println("  ",days[i])
            println("-"^80)
            continue
        end

        numExercises = length(days[i])
        for j in 1:numExercises
            println("  Exercise ", j)
            keyArr = keys(days[i][j])
            for key in keyArr
                print("    ",key, ": ")
                vals = getfield(days[i][j], key)
                if typeof(vals) == String
                    println(vals)
                else
                    numVals = length(vals)
                    for i in 1:numVals
                        if typeof(vals[i]) == String
                            print(vals[i][1:end])
                            i < numVals ? print(", ") : nothing
                        else
                            if typeof(vals[i]) == Char
                                print(vals[i])
                            else
                                print(vals[i])
                                i < numVals ? print(", ") : nothing
                            end
                        end
                    end
                    println("")
                end
            end
            # println("")
        end
        println("-"^80)
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
                push!(lst, ["RPE: "; round.(setScheme[j].rpe, digits=2)])
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
