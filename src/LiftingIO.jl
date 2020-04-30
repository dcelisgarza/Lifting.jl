import Base: println, write

"""
```
println(programme::Programme, idx = 1:length(programme))
```
Prints the programme in console in a nicely formatted style. Users can optionally provide an index, be it an integer, unit range, tuple or array. The index corresponds to the day. Function [`write`](@ref) writes to a csv and has the same indexing functionality.

# Examples
```
println(MyProg)             # Prints whole programme.
println(MyProg, 1)          # Prints day 1.
ndays = length(MyProg)      # Length returns the number of days.
println(MyProg, 1:2:ndays)  # Prints every second day starting from the first.
println(MyProg, [1, 5, 20]) # Prints days 1, 5 and 20 (also works with tuples).
```
"""
function println(programme::Programme, idx = 1:length(programme))
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

"""
```
write(
    filename::AbstractString,
    programme::Programme,
    idx = 1:length(programme);
    delim::Char = ',',
    log::Bool = false,
)
```
Writes programme to CSV. It defaults to delimiting the file with commas but you can choose your own. If `log == true`, generate a log file where users can log their progress. Automatically appends "Log_" to the start of the filename. Indexing works the same way as [`println`](@ref).

!!! note
    The log file will print every exercise in the programme, even those you may not care about. These can be deleted. However if you do so, make sure to change the number in cell `[1,1]` (top left) to the number of exercises you're keeping track of. This number is used by the programme to know how many columns to read.
"""
function write(
    filename::AbstractString,
    programme::Programme,
    idx = 1:length(programme);
    delim::Char = ',',
    log::Bool = false,
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
        end
    end

end

"""
```
numDays(dates; format = "dd/mm/yyyy")
```
Takes an array strings which represent dates in the format provided and calculates the number of days between the first and last entries.
"""
function numDays(dates; format = "dd/mm/yyyy")
    # Turns date string into date format.
    tdates = Date.(dates, format)
    # Calculate the number of days from the beginning.
    days = getfield.(tdates - minimum(tdates), :value)

    return days
end

"""
```
loadLogFile(programme::Programme)
```
Loads the programme's log file and returns the following values:
 - `keyArr` is array of exercise names which double as the keys for the other outputs,
 - `date` is a dictionary containing the dates in which each exercise was performed,
 - `day1` is a dictionary containing the first date on which each exercise was performed,
 - `Δdays` is a dictionary containing the number of days elapsed from the between `day1` and the last registered date,
 - `reps` is a dictionary containing the number of reps performed,
 - `wght` is a dictionary containing the weight used,
 - `rpe` is a dictionary containing the rpe for the set.

The function drops missing values so every exercise will have all its corresponding pieces of data for a given date. It also doesn't matter if you logged only reps and weight for a session, you just won't have the data point for that session's rpe. The only thing you have to worry about is logging your progress properly. For a nice summary of progress I recommend logging only the top sets for each entry, you can have more of course but you will have to filter out data to make valuable analyses. Regardless, logging all your sessions in a notebook or app is recommended.

It assumes the filename was not changed from the one generated by [`write`](@ref).
"""
function loadLogFile(programme::Programme)
    data = readdlm("Log_" * programme.name * ".csv", ',')

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

"""
```
plotData(prog::Programme, names::Vector{Any}, x, y, args...; kwargs...)
```
Plot your hard earned progress with smooth curves and labels the figures appropriately. Skips missing values so your programme won't crash. Creates a new figure for each call, creating an array of figures. For mutating the same figure see [`plotData!`](@ref).
"""
function plotData(prog::Programme, names, x, y, args...; kwargs...)
    # Ensure we don't loop through characters.
    typeof(names) == String ? names = [names] : nothing

    figArr = []

    for name in names
        if ismissing(x[name]) || ismissing(y[name])
            continue
        end
        length(x[name]) <= 3 ? continue : nothing
        spl = Spline1D(x[name], y[name], k=3)
        xrange = range(x[name][1]; stop = x[name][end], step=0.25)
        if haskey(kwargs, :label) == true
            fig = plot(xrange, spl(xrange); kwargs...)
        else
            fig = plot(xrange, spl(xrange); label = prog.exerProg[name][1].name, kwargs...)
        end
        push!(figArr, fig)
    end
    return figArr
end

"""
```
plotData!(fig, prog::Programme, names::Vector{Any}, x, y, args...; kwargs...)
```
Same as [`plotData`](@ref) but mutates the input figure.
"""
function plotData!(fig, prog::Programme, names, x, y, args...; kwargs...)
    # Ensure we don't loop through characters.
    typeof(names) == String ? names = [names] : nothing

    for name in names
        if ismissing(x[name]) || ismissing(y[name])
            continue
        end
        length(x[name]) < 3 ? continue : nothing
        spl = Spline1D(x[name], y[name], k=3)
        xrange = range(x[name][1]; stop = x[name][end], step=0.25)
        if haskey(kwargs, :label) == true
            plot!(fig, xrange, spl(xrange); kwargs...)
        else
            plot!(fig, xrange, spl(xrange); label = prog.exerProg[name][1].name, kwargs...)
        end
    end
end

"""
```
scatterData(prog::Programme, names::Vector{Any}, x, y, args...; kwargs...)
```
Makes a scatter plot of the data. For mutating the same figure see [`scatterData!`](@ref).
"""
function scatterData(prog::Programme, names, x, y, args...; kwargs...)
    # Ensure we don't loop through characters.
    typeof(names) == String ? names = [names] : nothing

    figArr = []

    for name in names
        if ismissing(x[name]) || ismissing(y[name])
            continue
        end
        if haskey(kwargs, :label) == true
            fig = scatter(x[name], y[name]; kwargs...)
        else
            fig = scatter(x[name], y[name]; label = prog.exerProg[name][1].name, kwargs...)
        end
        push!(figArr, fig)
    end
    return figArr
end

"""
```
scatterData!(fig, prog::Programme, names::Vector{Any}, x, y, args...; kwargs...)
```
Same as [`scatterData`](@ref) but mutates the figure.
"""
function scatterData!(fig, prog::Programme, names, x, y, args...; kwargs...)
    # Ensure we don't loop through characters.
    typeof(names) == String ? names = [names] : nothing

    for name in names
        if ismissing(x[name]) || ismissing(y[name])
            continue
        end
        if haskey(kwargs, :label) == true
            scatter!(fig, x[name], y[name]; kwargs...)
        else
            scatter!(fig, x[name], y[name]; label = prog.exerProg[name][1].name, kwargs...)
        end
    end
end
