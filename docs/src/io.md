# IO

The package is capable of displaying programmes in the console, writing CSV files and using CSV files for plotting and analysis.

## Displaying

The default printing does a poor job of displaying the programme so we multiple dispatched our way into making it look pretty like Robert Oberst.
```@docs
println(::Programme, ::Any)
```

May the [`Programme`](@ref) be with you, always. This lets you do so, implement the programme in your favourite app, put on google sheets, log your progress, and then use that log to analyse your progress with [`loadLogFile`](@ref) and [`plotData`](@ref). Alternatively be a monster and print everything out, who needs trees anyway?
```@docs
write(
    ::AbstractString,
    ::Programme,
    ::Any;
    ::Char,
    ::Bool,
)
```

## Analysis and Utility

If you've been logging your progress like a good lifter you can load it into Julia for some a n a l y t i c s.
```@docs
loadLogFile(programme::Dict, key)
```

Logs usually use dates, but we never want to know our progress as a function date do we? We want it as a function of time. This turns dates into number of days between the earliest date and the rest.
```@docs
numDays(dates; format = "dd/mm/yyyy")
```

A picture is worth a thousand words, a lifter is worth at least half a human.
```@docs
plotData(prog::Programme, names, x, y, args...; kwargs...)
plotData!(figure, prog::Programme, names, x, y, args...; kwargs...)
```
