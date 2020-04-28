# Functions and Methods

```julia
function getBetter!(me::Person, args...)
    newArgs = []
    improvements = []
    for arg in args
        improve, arg = action(me, arg)
        push!(newArgs, arg)
        push!(improvements, improve)
    end
    me += improvements
    me.goal ? getBetter!(me, newArgs...) : return me, newArgs
end
```

## Utility

> No citizen has a right to be an amateur in the matter of physical training… what a disgrace it is for a man to grow old without ever seeing the beauty and strength of which his body is capable.
> - Socrates on strong men

There are various utility functions and methods that enable the programme to work, these can be treated as black boxes.

Creating a programme's schedule is done by pushing the exercise and progression to a vector, [`push!`](@ref) and [`insert!`](@ref) have been defined to let users do so.
```@docs
push!(
    A::AbstractArray{T, 1} where {T},
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
```
```@docs
insert!(
    A::AbstractArray{T, 1} where {T},
    index::Integer,
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
```

## Analysis

> The shortest path between two truths in the real domain passes through the complex domain.
> - Jacques Hadamard on complex analysis being real analysis' daddy

One of the purposes of `Lifting.jl` is to provide an analytic approach to training as well as automatically and dynamically adjust weights based on performance.

The building blocks of these more complex functions are [`calcIntensity`](@ref), [`calcRPE`](@ref), [`calcReps`](@ref). We also have a more primitive function [`intensityArb`](@ref) to calculate intensity that is used in various programmes I've found.
```@docs
calcIntensity(reps::Integer, rpe::Real = 10)
```
```@docs
calcRPE(reps::Integer, intensity::Real)
```
```@docs
calcReps(reps::Integer, intensity::Real)
```
```@docs
intensityArb(var::Integer)
```

We also need to calculate ratios and rep maxes if we want to update our programme dynamically so there are functions for that too. This is done with [`calcIntensityRatio`](@ref), [`calcRPERatio`](@ref), [`calcRepRatio`](@ref), [`calcRepMax`](@ref).
```@docs
calcIntensityRatio(
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
```
```@docs
calcRPERatio(
    actualReps::Integer,
    actualIntensity::Real,
    targetReps::Integer,
    targetIntensity::Real,
)
```
```@docs
calcRepRatio(
    actualIntensity::Real,
    actualRPE::Real,
    targetIntensity::Real,
    targetRPE::Real,
)
```
```@docs
calcRepMax(
    weight::Real,
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
```

The last purely mathematical function is [`calcWeights`](@ref).
```@docs
calcWeights(exercise::Exercise, setScheme::SetScheme)
```

In order to calculate and/or adjust training maxes as well as set the next cycle's weights according to a programme's goals we have [`calcWeights`](@ref), [`adjustMaxes!`](@ref), [`adjustMaxes`](@ref), [`updateMaxes!`](@ref) and [`updateMaxes`](@ref).

```@docs
makeDays()
```

```@docs
adjustMaxes!(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
```

```@docs
adjustMaxes(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
```

```@docs
updateMaxes!(prog::Programme, names, reps; idx = missing)
```

```@docs
updateMaxes(prog::Programme, names, reps; idx = missing)
```

For calculating training maxes from logs we have [`calcTrainingMaxLogs`](@ref).
```@docs
calcTrainingMaxLogs
```
