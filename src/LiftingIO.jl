import Base: display, write
import DelimitedFiles: writedlm

function display(programme::Programme, idx = 1:length(programme.days))
    days = programme.days

    println("="^80)
    println("Programme: ", programme.name)
    for i in idx
        println("\nDay ", i)
        if typeof(days[i]) == String
            println("  ", days[i])
            println("-"^80)
            continue
        end

        numExercises = length(days[i])
        for j = 1:numExercises
            if typeof(days[i][j]) == String
                println("  ", days[i][j])
                break
            end
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
            print(name)
            if haskey(days[i][j], :modality)
                print(": ")
                modality = days[i][j].modality
                if typeof(modality) == String
                    print(days[i][j].modality)
                else
                    for k = 1:length(modality)
                        print(days[i][j].modality[k])
                        k < length(modality) ? print(", ") : nothing
                    end
                end
            end
            println("")

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

function write(
    filename::AbstractString,
    programme::Programme,
    idx = 1:length(programme.days);
    delim = ',',
    log = false,
)
    if !log
        open(filename, "w") do io
            days = programme.days
            write(io, "# Programme: ", programme.name, "\n")
            writedlm(io, ["sets" "reps" "weight" "type" "rpe" "intensity"], delim)
            for i in idx
                writedlm(io, ["Day" i], delim)
                if typeof(days[i]) == String
                    write(io, days[i], "\n")
                    continue
                end

                numExercises = length(days[i])
                for j = 1:numExercises
                    if typeof(days[i][j]) == String
                        write(io, days[i][j], "\n")
                        break
                    end
                    numSets = length(days[i][j].sets)
                    name = days[i][j].name
                    type = days[i][j].type
                    set = days[i][j].sets
                    reps = days[i][j].reps
                    wght = days[i][j].wght
                    rpe = days[i][j].rpe
                    intensity = round.(days[i][j].intensity .* 100, digits = 2)

                    write(io, name)
                    if haskey(days[i][j], :modality)
                        write(io, ", ")
                        modality = days[i][j].modality
                        if typeof(modality) == String
                            write(io, days[i][j].modality)
                        else
                            for k = 1:length(modality)
                                write(io, days[i][j].modality[k])
                                k < length(modality) ? write(io, ", ") : nothing
                            end
                        end
                    end
                    write(io, "\n")

                    if numSets == 1
                        writedlm(
                            io,
                            [set[1] reps[1] wght[1] type[1:end] rpe[1] intensity[1]],
                            delim,
                        )
                    else
                        for k = 1:numSets
                            writedlm(
                                io,
                                [set[k] reps[k] wght[k] type[k] rpe[k] intensity[k]],
                                delim,
                            )
                        end
                    end
                end
            end
        end
    else
        open("Log "*filename, "w") do io
            dict = programme.dict
            writedlm(io, ["# Name" "Date" "Reps" "Weight" "RPE"], delim)
            for key in keys(dict)
                writedlm(io, [key "01/01/0000" -1.0 -1.0 -1.0], delim)
            end
        end
    end

end
