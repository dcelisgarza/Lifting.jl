import Base: display

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
                push!(lst, ["Wght: "; setScheme[j].setWeight])
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
