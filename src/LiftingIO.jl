import Base: println, write

function println(programme::Programme, idx = 1:length(programme.days))
    days = programme.days

    println("\n","="^80)
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
            writedlm(
                io,
                ["sets" "reps" "weight" "type" "rpe" "intensity"],
                delim,
            )
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
        open("Log_" * filename, "w") do io
            exerProg = programme.exerProg
            keyArr = [key for key in keys(exerProg)]
            writedlm(io, [vcat([length(keyArr)], keyArr)], delim)
            arr = repeat(["reps";"wght";"rpe"], outer=length(keyArr))

            writedlm(io, [vcat(["Date"], arr)], delim)
            # arr = vcat(["Date", "Reps", "Weight", "RPE"], keyArr)
            # writedlm(io, [arr] , delim)
            # for key in keys(exerProg)
            #     writedlm(io, [key "01/01/0000" -1 -1.0 -1.0], delim)
            # end
        end
    end

end

function numDays(dates; format = "dd/mm/yyyy")
    # Turns date string into date format.
    tdates = Date.(dates, format)
    # Calculate the number of days from the beginning.
    days = getfield.(tdates - minimum(tdates), :value)

    return days
end

function loadLogFile(programme::Dict, key)
    data = readdlm("Log_" * programme[key].name * ".csv", ',')

    numExercises = data[1,1]
    keyArr = String.(data[1, 2:(numExercises + 1)])
    data[data .== ""] .= missing
    dates = data[3:end, 1]

    df = DataFrame(data[3:end, :])

    # Vector of vectors. date[i][:] are the dates when the exercise i was performed.
    date = Dict()
    # Vector. day1[i] is the first day exercise i was performed. Useful for plotting with a global timeframe.
    day1 = Dict()
    # Vector of vectors. Δdays[i][j] number of days between day1[i] and date[i][j]. Useful for plotting progression over time.
    Δdays = Dict()
    # Vector of vectors. Reps, weight and rpe. For example reps[i][j] corresponds to date[i][j].
    reps = Dict()
    wght = Dict()
    rpe = Dict()

    # We make data frames because we want to drop missing values from log file while keeping the dates they were performed at.
    repsDf = DataFrame([dates data[3:end, 2:3:end]])
    wghtDf = DataFrame([dates data[3:end, 3:3:end]])
    rpeDf = DataFrame([dates data[3:end, 4:3:end]])

    for (i, key) in enumerate(keyArr)
        # Date is the first value in the dataframe, we add 1 to get the relevant data.
        idx = i + 1
        # Drop missing values from dataframe without modifying them.
        tmpReps = dropmissing(repsDf, idx)
        tmpWght = dropmissing(wghtDf, idx)
        tmpRpe = dropmissing(rpeDf, idx)
        # Dates for entry i. We could use any of the other tmp dataframes.
        push!(date, key => tmpReps[:, 1])
        # Reps, weight and rpe.
        push!(reps, key => tmpReps[:, idx])
        push!(wght, key => tmpWght[:, idx])
        push!(rpe, key => tmpRpe[:, idx])
        # Calculate days between entries.
        if isempty(tmpReps[:, 1])
            push!(Δdays, key => missing)
            push!(day1, key => missing)
        else
            push!(Δdays, key => numDays(date[key]))
            push!(day1, key => minimum(date[key]))
        end
    end

    return keyArr, date, day1, Δdays, reps, wght, rpe
end

function calcTrainingMaxLogs(prog::Programme, names, reps, weight)
    trainingMax = deepcopy(weight)
    for name in names
        isempty(reps[name]) ? continue : nothing
        for j in 1:length(reps[name])
            trainingMax[name][j] = 0.0
            trainingMax[name][j] = adjustMaxes(name, prog.exerProg, reps[name][j]; weight = weight[name][j])
        end
    end
    return trainingMax
end
