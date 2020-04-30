"""
```
abstract type AbstractProgression end
struct LinearProgression <: AbstractProgression end
struct DoubleProgression <: AbstractProgression end
struct PeriodProgression <: AbstractProgression end
struct BlockProgression <: AbstractProgression end
```
Progression types. Use these to make specialised functions and add new functionality.
"""
abstract type AbstractProgression end
struct LinearProgression <: AbstractProgression end
struct DoubleProgression <: AbstractProgression end
struct PeriodProgression <: AbstractProgression end
struct BlockProgression <: AbstractProgression end

"""
```
AbstractProgramme
```
Programme types.
"""
abstract type AbstractProgramme end

import Base: round, length, getindex, iterate, @_inline_meta
round(x::Real, y::Real, mode::Function = floor) = mode(x / y) * y
length(x::Function) = 1

"""
```
calcIntensity(reps::Integer, rpe::Real)
```
This function calculates a set's intensity as a function of reps and RPE. It does a disconcertedly good job of reproducing RPE charts. It is defined as follows:

``z = \\dfrac{1}{a + b (x + 10 - y) + (x - 1) \\left(\\dfrac{c}{x} + \\dfrac{d}{y}\\right)},``

where ``z \\equiv`` intensity, ``x \\equiv`` reps, ``y \\equiv`` RPE, ``a = 0.995,~ b = 0.0333,~c = 0.0025,~d = 0.1``.

We cap `rpe` to 10 and `intensity` to 1.
"""
@inline function calcIntensity(reps::Integer, rpe::Real)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    rpe = minimum((rpe, 10))
    return minimum((
        1 / (a + b * (reps + 10 - rpe) + (reps - 1) * (c / reps + d / rpe)),
        1,
    ))
end

"""
```
calcRPE(reps::Integer, intensity::Real)
```
Solving [`calcIntensity`](@ref) for `rpe` yields the following function:

``x = \\dfrac{\\sqrt{\\left(a y z - b y^2 z + 10 b y z + c y z - d z - y\\right)^2 + 4 c y z (b y z + d z)} - a y z + b y^2 z - 10 b y z - c y z + d z + y}{2 z (b y + d)},``

where the variables are the same as [`calcIntensity`](@ref).

We cap `intensity` to 1 and the `rpe` to 10.
"""
@inline function calcRPE(reps::Integer, intensity::Real)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    intensity = minimum((intensity, 1))
    rpe =
        (
            sqrt(
                (
                    a * reps * intensity +
                    b * reps^2 * intensity +
                    10 * b * reps * intensity +
                    c * reps * intensity - c * intensity - reps
                )^2 +
                4 *
                b *
                reps *
                intensity *
                (d * reps^2 * intensity - d * reps * intensity),
            ) +
            a * reps * intensity +
            b * reps^2 * intensity +
            10 * b * reps * intensity +
            c * reps * intensity - c * intensity - reps
        ) / (2 * b * reps * intensity)

    return minimum((rpe, 10))
end

"""
```
calcReps(intensity::Real, rpe::Real)
```
Solving [`calcIntensity`](@ref) for `reps` yields the following function:

``y = \\dfrac{\\sqrt{\\left(a x z + b x^2 z + 10 b x z + c x z - c z - x\\right)^2 + 4 b x z \\left(d x^2 z - d x z\\right)} + a x z + b x^2 z + 10 b x z + c x z - c z - x}{2 b x z},``

where the variables are the same as [`calcIntensity`](@ref).

We cap `intensity` to 1 and `rpe` to 10.
"""
@inline function calcReps(intensity::Real, rpe::Real)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    intensity = minimum((intensity, 1))
    rpe = minimum((rpe, 10))
    reps =
        (
            sqrt(
                (
                    a * rpe * intensity - b * rpe^2 * intensity +
                    10 * b * rpe * intensity +
                    c * rpe * intensity - d * intensity - rpe
                )^2 +
                4 * c * rpe * intensity * (b * rpe * intensity + d * intensity),
            ) - a * rpe * intensity + b * rpe^2 * intensity -
            10 * b * rpe * intensity - c * rpe * intensity +
            d * intensity +
            rpe
        ) / (2 * intensity * (b * rpe + d))

    return Int(round(reps, digits = 0))
end

"""
```
calcIntensityRatio(
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
```
Calculate the ratio between `targetIntensity/actualIntensity`.

All RPE values are capped to 10.
"""
@inline function calcIntensityRatio(
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
    actualRPE = minimum((actualRPE, 10))
    targetRPE = minimum((targetRPE, 10))

    actualIntensity = calcIntensity(actualReps, actualRPE)
    targetIntensity = calcIntensity(targetReps, targetRPE)
    return targetIntensity / actualIntensity
end

"""
```
calcRPERatio(
    actualReps::Integer,
    actualIntensity::Real,
    targetReps::Integer,
    targetIntensity::Real,
)
```
Calculate the ratio between `targetRPE/actualRPE`.

All intensity values are capped to 1.
"""
@inline function calcRPERatio(
    actualReps::Integer,
    actualIntensity::Real,
    targetReps::Integer,
    targetIntensity::Real,
)
    actualIntensity = minimum((actualIntensity, 1))
    targetIntensity = minimum((targetIntensity, 1))

    actualRPE = calcRPE(actualReps, actualIntensity)
    targetRPE = calcRPE(targetReps, targetIntensity)
    return targetRPE / actualRPE
end

"""
```
calcRepRatio(
    actualIntensity::Real,
    actualRPE::Real,
    targetIntensity::Real,
    targetRPE::Real,
)
```
Calculate the ratio between `targetReps/actualReps`.

All intensity values are capped to 1 and all rpe values to 10.
"""
@inline function calcRepRatio(
    actualIntensity::Real,
    actualRPE::Real,
    targetIntensity::Real,
    targetRPE::Real,
)
    actualIntensity = minimum((actualIntensity, 1.0))
    targetIntensity = minimum((targetIntensity, 1.0))
    actualRPE = minimum((actualRPE, 10.0))
    targetRPE = minimum((targetRPE, 10.0))

    actualReps = calcReps(actualIntensity, actualRPE)
    targetReps = calcReps(targetIntensity, targetRPE)
    return targetReps / actualReps
end

"""
```
calcRepMax(
    weight::Real,
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
```
Calculates the rep weight for a target number of reps, `targetReps`, at a target rpe, `targetRPE`, given an actual number of reps, `actualReps`, and an actual rpe, `actualRPE` and `weight`. It's just the weight multiplied by the intensity ratio.
"""
@inline function calcRepMax(
    weight::Real,
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)

    actualRPE = minimum((actualRPE, 10.0))
    targetRPE = minimum((targetRPE, 10.0))

    intensity = calcIntensityRatio(actualReps, actualRPE, targetReps, targetRPE)
    return weight * intensity
end

"""
```
intensityArb(var::Integer)
```
Calculates intensity given an arbitrary variable. I've seen this used as a proxy for reps at a given RPE. I've seen `var` be anything between the number of reps to the number of reps + 2, 4, 6, 8 depending on a target rpe. This makes for a good rough guide. It is defined as

``z = \\dfrac{1}{a + b x},``

where ``x \\equiv`` var and the constants are the same as [`calcIntensity`](@ref).

!!! note
    `calcIntensity` works over a *much* wider range of RPE and rep combinations.
"""
@inline function intensityArb(var::Integer)
    return 1 / (0.995 + 0.0333 * var)
end

"""
```
mutable struct SetScheme{
    T1 <: Union{<:AbstractString, Vector{<:AbstractString}},
    T2 <: Union{<:Integer, Vector{<:Integer}},
    T3 <: Union{<:Real, Vector{<:Real}},
    T4 <: Union{<:Function, Vector{<:Function}},
    T5 <: Bool,
}
    type::T1
    sets::T2
    reps::T2
    intensity::T3
    rpe::T3
    addWeight::T3
    roundMode::T4
    wght::T3
    rpeMode::T5
end
```
This structure contains user-created set schemes. Its parameters are as follows:

- `type` defines the set type,
- `sets` the number of sets of the corresponding type,
- `reps` is the number of reps in the set,
- `intensity` is the set intensity,
- `rpe` is the set's target RPE,
- `addWeight` is extra weight on top of the normally calculated weight (useful for chains, bands or microplates),
- `wght` is the set weight, which is calculated later when pairing progression schemes to exercises,
- `rpeMode` whether the set scheme is defined via RPE or percentage intensity, if true, the values in `intensity` will be assumed to be RPE and the percentage intensity will be calculated using RPE and the number of reps in the set, else the values in `intensity` will be used as provided.

It uses the following constructor, which takes care of any required computations.
```
SetScheme(;
    type::T1 = "Default",
    sets::T2 = 5,
    reps::T2 = 5,
    intensity::T3 = 0.75,
    addWeight::T4 = 0,
    roundMode::T5 = floor,
    rpeMode::Bool = false,
) where {
    T1 <: Union{<:AbstractString, Vector{<:AbstractString}},
    T2 <: Union{<:Integer, Vector{<:Integer}},
    T3 <: Union{<:Real, Vector{<:Real}},
    T4 <: Union{<:Real, Vector{<:Real}},
    T5 <: Union{<:Function, Vector{<:Function}},
}
```
Every parameter has defaults, so users have the ability to provide only the ones they want to modify.

If `rpeMode == true`, intensity is based on RPE, which lies in the interval ``x ∈ (0, 10]``. If `rpeMode == false`, then intensity is relative to training max and therefore lies in the interval ``x ∈ [0, 1]``. The lenghts of all input vectors must be equal.

## Example
Here we define a simple set scheme. Since we are not providing any added weight via `addWeight`, that parameter becomes a zero vector.
```
julia> SampleScheme = SetScheme(;
           type = ["Long Rest", "Longer Rest", "Longest Rest", "Optional Forced Reps"],
           sets = [1, 2, 1, 1],
           reps = [12, 14, 10, 5],
           intensity = [9.5, 10, 10, 10],
           roundMode = [floor, floor, ceil, ceil],
           rpeMode = true,
       )
SetScheme{Array{String,1},Array{Int64,1},Array{Float64,1},Array{Function,1},Bool}(["Long Rest", "Longer Rest", "Longest Rest", "Optional Forced Reps"], [1, 2, 1, 1], [12, 14, 10, 5], [0.6538806237677003, 0.6275409806672554, 0.7041013906002465, 0.8309098462816784], [9.5, 10.0, 10.0, 10.0], [0.0, 0.0, 0.0, 0.0], Function[floor, floor, ceil, ceil], [0.0, 0.0, 0.0, 0.0], true)
```
"""
mutable struct SetScheme{
    T1 <: Union{<:AbstractString, Vector{<:AbstractString}},
    T2 <: Union{<:Integer, Vector{<:Integer}},
    T3 <: Union{<:Real, Vector{<:Real}},
    T4 <: Union{<:Function, Vector{<:Function}},
    T5 <: Bool,
}
    type::T1
    sets::T2
    reps::T2
    intensity::T3
    rpe::T3
    addWeight::T3
    roundMode::T4
    wght::T3
    rpeMode::T5

    function SetScheme(;
        type::T1 = "Default",
        sets::T2 = 5,
        reps::T2 = 5,
        intensity::T3 = 0.75,
        addWeight::T4 = 0,
        roundMode::T5 = floor,
        rpeMode::Bool = false,
    ) where {
        T1 <: Union{<:AbstractString, Vector{<:AbstractString}},
        T2 <: Union{<:Integer, Vector{<:Integer}},
        T3 <: Union{<:Real, Vector{<:Real}},
        T4 <: Union{<:Real, Vector{<:Real}},
        T5 <: Union{<:Function, Vector{<:Function}},
    }
        difSets = length(sets)
        if difSets > 1 && length(intensity) == 1
            intensity = fill(0.75, difSets)
        end
        if difSets > 1 && length(addWeight) == 1
            addWeight = zeros(difSets)
        end
        if difSets > 1 && length(roundMode) == 1
            roundMode = fill(floor, difSets)
        end

        @assert length(sets) ==
                length(reps) ==
                length(intensity) ==
                length(addWeight) ==
                length(roundMode) "lengths of sets $(length(sets)), reps $(length(reps)), intensity $(length(intensity)), addWeight $(length(addWeight)) and roundMode $(length(roundMode)) must be equal."
        rpe = 0.0
        wght = 0.0
        if difSets > 1
            rpe = zeros(difSets)
            wght = zeros(difSets)
        end
        if rpeMode
            rpe = intensity
            intensity = calcIntensity.(reps, intensity)
        else
            rpe = calcRPE.(reps, intensity)
        end
        new{
            typeof(type),
            typeof(sets),
            typeof(intensity),
            typeof(roundMode),
            typeof(rpeMode),
        }(
            type,
            sets,
            reps,
            intensity,
            rpe,
            convert.(eltype(intensity), addWeight),
            roundMode,
            wght,
            rpeMode,
        )
    end
end
getindex(x::SetScheme, i::Integer) = i == 1 ? x : throw(BoundsError)
length(x::SetScheme) = 1
iterate(A::SetScheme, i = 1) =
    (@_inline_meta; (i % UInt) - 1 < length(A) ? (@inbounds A[1], i + 1) : nothing)

"""
```
struct Progression{
    T1 <: AbstractProgression,
    T2 <: AbstractString,
    T3 <: Integer,
    T4 <: Union{<:SetScheme, Vector{<:SetScheme}},
} <: AbstractProgression
    type::T1
    name::T2
    sessions::T3
    period::T3
    setScheme::T4
end
```
This structure holds user-defined progressions. Its parameters are as follows:
- `type` is the progression type which is a subtype of [`AbstractProgression`](@ref),
- `name` is the progression name,
- `sessions` is the number of different sessions in a week,
- `period` is the progression period,
- `setScheme` is a previously defined set scheme or vector of set schemes, the length must be equal to `sessions * period`.

This structure lets users create different types of progressions, from simple day in day out progressions to complex undulating periodisation and block progressions.

Progressions are created with the following constructor function,
```
function Progression(;
    type::T1,
    name::T2,
    sessions::T3 = 1,
    period::T3 = 1,
    setScheme::T4,
) where {
    T1 <: AbstractProgression,
    T2 <: AbstractString,
    T3 <: Integer,
    T4 <: Union{<:SetScheme, Vector{<:SetScheme}},
}
```

## Example

Assuming we've run the example in [`SetScheme`](@ref) we can create a simple progression.
```
julia> SampleProgression = Progression(;
           type = LinearProgression(),
           name = "Progression Name",
           setScheme = SampleScheme,
       )
Progression{LinearProgression,String,Int64,SetScheme{Array{String,1},Array{Int64,1},Array{Float64,1},Array{Function,1},Bool}}(LinearProgression(), "Progression Name", 1, 1, SetScheme{Array{String,1},Array{Int64,1},Array{Float64,1},Array{Function,1},Bool}(["Long Rest", "Longer Rest", "Longest Rest", "Optional Forced Reps"], [1, 2, 1, 1], [12, 14, 10, 5], [0.6538806237677003, 0.6275409806672554, 0.7041013906002465, 0.8309098462816784], [9.5, 10.0, 10.0, 10.0], [0.0, 0.0, 0.0, 0.0], Function[floor, floor, ceil, ceil], [0.0, 0.0, 0.0, 0.0], true))
```
"""
struct Progression{
    T1 <: AbstractProgression,
    T2 <: AbstractString,
    T3 <: Integer,
    T4 <: Union{<:SetScheme, Vector{<:SetScheme}},
} <: AbstractProgression
    type::T1
    name::T2
    sessions::T3
    period::T3
    setScheme::T4

    function Progression(;
        type::T1,
        name::T2,
        sessions::T3 = 1,
        period::T3 = 1,
        setScheme::T4,
    ) where {
        T1 <: AbstractProgression,
        T2 <: AbstractString,
        T3 <: Integer,
        T4 <: Union{<:SetScheme, Vector{<:SetScheme}},
    }
        @assert length(setScheme) == sessions * period "length of setScheme, $(length(setScheme)), must be equal to sessions * period, $(sessions*period)."

        new{typeof(type), typeof(name), typeof(sessions), typeof(setScheme)}(
            type,
            name,
            sessions,
            period,
            setScheme,
        )
    end
end
getindex(x::Progression, i::Integer) = i == 1 ? x : throw(BoundsError)
length(x::Progression) = 1
iterate(A::Progression, i = 1) =
    (@_inline_meta; (i % UInt) - 1 < length(A) ? (@inbounds A[1], i + 1) : nothing)

"""
```
mutable struct Exercise{
    T1 <: AbstractString,
    T2 <: Union{AbstractString, Vector{<:AbstractString}},
    T3 <: Union{AbstractString, Vector{<:AbstractString}},
    T4 <: Union{AbstractString, Vector{<:AbstractString}},
    T5 <: Union{AbstractString, Vector{<:AbstractString}},
    T6 <: Real,
    T7 <: Real,
    T8 <: Function,
}
    name::T1
    equipment::T2
    modality::T3
    size::T4
    muscles::T5
    trainingMax::T6
    roundBase::T7
    roundMode::T8
end
```
User created exercises are encapsulated in this structure. Its parameters are as follows:
- `name` is the exercise name,
- `equipment` is the equipment required,
- `modality` are any modifiers to the exercise (for example blocks),
- `size` are the size/resistance of said modifiers (for example 2 inch),
- `muscles` are the muscles targeted,
- `trainingMax` is the training maximum used to calculate set weights when pairing with a progression,
- `roundBase` is the base to which set weights are rounded,
- `roundMode` is the rounding function used.

This uses the following constructor which provides default values for anything users don't need/want to track,
```
function Exercise(;
    name::T1,
    equipment::T2 = "NA",
    modality::T3 = "Default",
    muscles::T4 = "NA",
    trainingMax::T6 = 0,
    size::T5 = "NA",
    roundBase::T7 = 2.5,
    roundMode::T8 = floor,
) where {
    T1 <: AbstractString,
    T2 <: Union{AbstractString, Vector{<:AbstractString}},
    T3 <: Union{AbstractString, Vector{<:AbstractString}},
    T4 <: Union{AbstractString, Vector{<:AbstractString}},
    T5 <: Union{AbstractString, Vector{<:AbstractString}},
    T6 <: Real,
    T7 <: Real,
    T8 <: Function,
}
end
```

## Examples

Say we want to bench press off a 1 inch block and a semi supinated grip on a swiss bar. We can easily create this exercise
```
julia> BenchAccessory = Exercise(;
           name = "Swiss Bar Bench",
           modality = ["Block" , "Semi-Supinated"],
           equipment = "Swiss Bar",
           size = "1 inch",
           muscles = ["Pecs", "Triceps", "Front Delts"],
           trainingMax = 100,
           roundBase = 2.5,
           roundMode = floor,
       )
Exercise{String,String,Array{String,1},String,Array{String,1},Float64,Float64,typeof(floor)}("Swiss Bar Bench", "Swiss Bar", ["Block", "Semi-Supinated"], "1 inch", ["Pecs", "Triceps", "Front Delts"], 100.0, 2.5, floor)
```
"""
mutable struct Exercise{
    T1 <: AbstractString,
    T2 <: Union{AbstractString, Vector{<:AbstractString}},
    T3 <: Union{AbstractString, Vector{<:AbstractString}},
    T4 <: Union{AbstractString, Vector{<:AbstractString}},
    T5 <: Union{AbstractString, Vector{<:AbstractString}},
    T6 <: Real,
    T7 <: Real,
    T8 <: Function,
}
    name::T1
    equipment::T2
    modality::T3
    size::T4
    muscles::T5
    trainingMax::T6
    roundBase::T7
    roundMode::T8

    function Exercise(;
        name::T1,
        equipment::T2 = "NA",
        modality::T3 = "Default",
        muscles::T4 = "NA",
        trainingMax::T6 = 0,
        size::T5 = "NA",
        roundBase::T7 = 2.5,
        roundMode::T8 = floor,
    ) where {
        T1 <: AbstractString,
        T2 <: Union{AbstractString, Vector{<:AbstractString}},
        T3 <: Union{AbstractString, Vector{<:AbstractString}},
        T4 <: Union{AbstractString, Vector{<:AbstractString}},
        T5 <: Union{AbstractString, Vector{<:AbstractString}},
        T6 <: Real,
        T7 <: Real,
        T8 <: Function,
    }
        trainingMaxRound = round(trainingMax, roundBase, roundMode)

        new{
            typeof(name),
            typeof(equipment),
            typeof(modality),
            typeof(size),
            typeof(muscles),
            typeof(trainingMaxRound),
            typeof(roundBase),
            typeof(roundMode),
        }(
            name,
            equipment,
            modality,
            size,
            muscles,
            trainingMaxRound,
            roundBase,
            roundMode,
        )
    end
end
getindex(x::Exercise, i::Integer) = i == 1 ? x : throw(BoundsError)
length(x::Exercise) = 1
iterate(A::Exercise, i = 1) =
    (@_inline_meta; (i % UInt) - 1 < length(A) ? (@inbounds A[1], i + 1) : nothing)

"""
```
calcWeights(exercise::Exercise, setScheme::SetScheme)
```
This function calculates and updates the weights for each set according to the training max specified in `exercise.trainingMax` and the intensities of the sets in `setScheme`.
"""
function calcWeights(exercise::Exercise, setScheme::SetScheme)
    trainingMax = exercise.trainingMax
    roundBase = exercise.roundBase
    reps = setScheme.reps
    intensity = setScheme.intensity
    addWeight = setScheme.addWeight
    roundMode = setScheme.roundMode

    # Calculate wieghts.
    setScheme.wght =
        round.(trainingMax * intensity + addWeight, roundBase, roundMode)

    # Calculate target minimum RPE for a set.
    intense = setScheme.wght / trainingMax
    setScheme.rpe = round.(calcRPE.(reps, intense), digits = 2)

    return setScheme
end
function calcWeights(exercise::Exercise, prog::Progression)
    return calcWeights.(exercise, prog.setScheme)
end

"""
```
struct Programme{
    T1 <: AbstractProgramme,
    T2 <: AbstractString,
    T3 <: Dict{Any, Any},
    T4 <: Vector{Any},
}
    type::T1
    name::T2
    exerProg::T3
    days::T4
end
```
User created programmes are made with this structure. The parameters are as follows:
- `type` is the exercise type and is a subtype of [`AbstractProgramme`](@ref) (we recommend users define custom concrete types for their programmes),
- `name` is the programme name (we recommend the name is the same as the programme type),
- `exerProg` is a dictionary which pairs exercises and progressions with the key-value pair `name => (exercise, progression)`.
- `days` is the programme schedule where each entry in the vector has all the exercises for the day.

Each programme is different so the recommendation is to create a typed [`makeDays`](@ref) function for the programme type.

## Examples

Assuming we are using the previously defined [`Exercise`](@ref) and [`Progression`](@ref), we can create a programme. There are a few ways to do so but this is recommended.
```julia
# Define the programme's concrete type. Can be used to extend `makeDays`.
struct SampleProgramme <: AbstractProgramme end

# Define a dictionary that will contain an Exercise and its corresponding
# progression as a tuple or vector.
exerProg = Dict()

# Push exercises and progressions to dictionary. Using named tuples is
# recommended because it enables dot syntax as well as regular indexing.
# Each exercise is paired with its progression.
push!(
    exerProg,
    "BenchAccessory" => (exercise = BenchAccessory, progression = SampleProgression),
)

# Define the a function that creates the schedule. This lets you automatically
# update training maxes and makes changing the programme easier. Here we also
# define rest days but you can leave them out if need be. `makeDays` will be
# called for whatever type is given as its first argument. Different programme
# types will necessarily have and call different `makeDays` functions.
function makeDays(::SampleProgramme, exerProg)

    # One sub array per day you want to track.
    week = [[], [], [], [], [], [], []]

    # You can 'unroll' the dictionary contents or push them directly to your
    # schedule. If using named tuples dot syntax and normal numeric indexing
    # both work
    # exerProg["BenchAccessory"].exercise == exerProg["BenchAccessory"][1]
    BenchAccessory = exerProg["BenchAccessory"].exercise
    BenchAccessoryProg = exerProg["BenchAccessory"].progression


    # Push the exercise and progression to whichever day of the week you want.
    # If the progression has multiple set schemes, the corresponding scheme can
    # be accessed by adding the index as the last argument.
    # push!(week[1], BenchAccessory, BenchAccessoryProg, 2)
    # Which would fail because there is only one set scheme, but if
    # BenchAccessoryProg were to have more entries that would take the second.
    # push! is overloaded so it also automatically calculates the required
    # weights. You can do this manually but this is easier and more reliable.
    push!(week[1], BenchAccessory, BenchAccessoryProg)   # Day 1
    push!(week[2], "Rest")  # Day 2
    push!(week[3], BenchAccessory, BenchAccessoryProg)   # Day 3
    push!(week[4], "Rest")  # Day 4
    push!(week[5], BenchAccessory, BenchAccessoryProg)   # Day 5
    push!(week[5], "Rest")  # Day 6
    push!(week[7], "Rest")  # Day 7

    return week
end

# Create weekly schedule.
week = makeDays(SampleProgramme(), exerProg)

# Create programme.
sampleProgramme = Programme(
                            SampleProgramme(),
                            "SampleProgramme",
                            exerProg,
                            week
                        )
```

It's recommended users either import the default dictionary [`Lifting_Programmes`](@ref) and store their programmes there with key equal to the programme name and type. They can also create their own dictionary for their own creations.
"""
struct Programme{
    T1 <: AbstractProgramme,
    T2 <: AbstractString,
    T3 <: Dict{Any, Any},
    T4 <: Any,
}

    type::T1
    name::T2
    exerProg::T3
    days::T4

    function Programme(
        type::T1,
        name::T2,
        exerProg::T3,
        days::T4,
    ) where {
        T1 <: AbstractProgramme,
        T2 <: AbstractString,
        T3 <: Dict{Any, Any},
        T4 <: Any,
    }

        new{typeof(type), typeof(name), typeof(exerProg), typeof(days)}(
            type,
            name,
            exerProg,
            days,
        )
    end
end

getindex(p::Programme, idx...) = [p.days[i] for i in idx]
getindex(p::Programme, i) = p.days[i]
length(p::Programme) = length(p.days)

import Base: push!, insert!
"""
```
push!(
    A::AbstractArray{T, 1} where {T},
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
```
Calculates set weights using `exercise.trainingMax` and `progression.setScheme`, then unrolls the relevant data into a named tuple and pushes it to the end of vector A. See [`insert!`](@ref) which does the same but at a specified index of A.
"""
function push!(
    A::AbstractArray{T, 1} where {T},
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
    calcWeights.(exercise, progression.setScheme[i])
    if typeof(progression.setScheme[i].type) == String
        type = progression.setScheme[i].type
    else
        type = Tuple(progression.setScheme[i].type)
    end
    if exercise.modality == "Default"
        push!(
            A,
            (
                name = exercise.name,
                type = type,
                sets = Tuple(progression.setScheme[i].sets),
                reps = Tuple(progression.setScheme[i].reps),
                wght = Tuple(progression.setScheme[i].wght),
                rpe = Tuple(progression.setScheme[i].rpe),
                intensity = Tuple(progression.setScheme[i].intensity),
            ),
        )
    else
        push!(
            A,
            (
                name = exercise.name,
                modality = exercise.modality,
                type = type,
                sets = Tuple(progression.setScheme[i].sets),
                reps = Tuple(progression.setScheme[i].reps),
                wght = Tuple(progression.setScheme[i].wght),
                rpe = Tuple(progression.setScheme[i].rpe),
                intensity = Tuple(progression.setScheme[i].intensity),
            ),
        )
    end
end

"""
```
insert!(
    A::AbstractArray{T, 1} where {T},
    index::Integer,
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
```
Calculates set weights using `exercise.trainingMax` and `progression.setScheme`, then unrolls the relevant data into a named tuple and pushes it to index `index` of vector A. See [`push!`](@ref) which does the same but in the last index of A.
"""
function insert!(
    A::AbstractArray{T, 1} where {T},
    index::Integer,
    exercise::Exercise,
    progression::Progression,
    i::Integer = 1,
)
    calcWeights.(exercise, progression.setScheme[i])
    if typeof(progression.setScheme[i].type) == String
        type = progression.setScheme[i].type
    else
        type = Tuple(progression.setScheme[i].type)
    end
    if exercise.modality == "Default"
        insert!(
            A,
            index,
            (
                name = exercise.name,
                type = type,
                sets = Tuple(progression.setScheme[i].sets),
                reps = Tuple(progression.setScheme[i].reps),
                wght = Tuple(progression.setScheme[i].wght),
                rpe = Tuple(progression.setScheme[i].rpe),
                intensity = Tuple(progression.setScheme[i].intensity),
            ),
        )
    else
        insert!(
            A,
            index,
            (
                name = exercise.name,
                modality = exercise.modality,
                type = type,
                sets = Tuple(progression.setScheme[i].sets),
                reps = Tuple(progression.setScheme[i].reps),
                wght = Tuple(progression.setScheme[i].wght),
                rpe = Tuple(progression.setScheme[i].rpe),
                intensity = Tuple(progression.setScheme[i].intensity),
            ),
        )
    end
end

"""
```
adjustMaxes!(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
```
Adjusts a programme's training maxes using what is expected by the programme and the actual reps, `actualReps`, performed at the programme's highest intensity for the exercise contained in `dict[name]`. However, if `weight` is provided, `updateMaxes!` will use that to calculate the new training max instead of whatever the programme prescribes.

!!! note
    Adjustments made to training max are calculated based on what the programme expects vs actual performance. So if you spectacularly fail a set, the adjustment *down* will be relatively aggressive. Conversely if you absolutely smash it, the adjustment *up* will be relatively aggressive. Downward adjustments are more aggressive than upward ones.
"""
function adjustMaxes!(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
    entry = dict[name]
    exercise = entry[1]
    prog = entry[2]
    setScheme = prog.setScheme
    numSets = length(setScheme)

    idx1 = 0
    idx2 = 0
    tmp = 0.0
    old = 0.0
    maxWght = 0
    for i = 1:numSets
        old = tmp
        wght = setScheme[i].wght
        tmp = maximum(wght)
        tmp = maximum((tmp, old))
        if tmp > old || maxWght == 0
            maxWght = tmp
            idx1 = i
            idx3 = findfirst(x -> x == maxWght, wght)
            idx3 != nothing ? idx2 = idx3 : idx2 = idx1
        end
    end
    targetReps = setScheme[idx1].reps[idx2]
    targetIntensity = setScheme[idx1].intensity[idx2]
    targetRPE = calcRPE(targetReps, targetIntensity)
    actualRPE = calcRPE(actualReps, targetIntensity)
    metTarget = targetRPE <= actualRPE
    actualRPE = 2 * targetRPE - actualRPE

    # If we gave a specific weight we want to use it instead of using the maximum weight.
    if ismissing(weight)
        trainingMax =
            calcRepMax(maxWght, actualReps, actualRPE, targetReps, targetRPE)
    else
        trainingMax =
            calcRepMax(weight, actualReps, actualRPE, targetReps, targetRPE)
    end

    roundBase = exercise.roundBase
    roundMode = exercise.roundMode
    change = 0
    if metTarget
        if trainingMax < exercise.trainingMax
            change = roundBase
        else
            change =
                round(trainingMax - exercise.trainingMax, roundBase, roundMode)
            change = maximum((change, roundBase))
        end
    else
        if trainingMax < exercise.trainingMax
            change =
                round(exercise.trainingMax - trainingMax, roundBase, roundMode)
            change = -maximum((change, roundBase))
        else
            change =
                round(trainingMax - exercise.trainingMax, roundBase, roundMode)
            change = maximum((change, roundBase))
        end
    end

    exercise.trainingMax += change
    calcWeights(exercise, prog)
end

"""
```
adjustMaxes(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
```
Does the same as [`adjustMaxes!`](@ref) but without updating the programme's training maxes. It returns a tuple with the new training max and the would-be change to the programme's training max, `(trainingMax, change)``.
"""
function adjustMaxes(
    name::AbstractString,
    dict::Dict{Any, Any},
    actualReps::Integer;
    weight = missing,
)
    entry = dict[name]
    exercise = entry[1]
    prog = entry[2]
    setScheme = prog.setScheme
    numSets = length(setScheme)

    idx1 = 0
    idx2 = 0
    tmp = 0.0
    old = 0.0
    maxWght = 0
    for i = 1:numSets
        old = tmp
        wght = setScheme[i].wght
        tmp = maximum(wght)
        tmp = maximum((tmp, old))
        if tmp > old || maxWght == 0
            maxWght = tmp
            idx1 = i
            idx3 = findfirst(x -> x == maxWght, wght)
            idx3 != nothing ? idx2 = idx3 : idx2 = idx1
        end
    end
    targetReps = setScheme[idx1].reps[idx2]
    targetIntensity = setScheme[idx1].intensity[idx2]
    targetRPE = calcRPE(targetReps, targetIntensity)
    actualRPE = calcRPE(actualReps, targetIntensity)
    metTarget = targetRPE <= actualRPE
    actualRPE = 2 * targetRPE - actualRPE

    # If we gave a specific weight we want to use it instead of using the maximum weight.
    if ismissing(weight)
        trainingMax =
            calcRepMax(maxWght, actualReps, actualRPE, targetReps, targetRPE)
    else
        trainingMax =
            calcRepMax(weight, actualReps, actualRPE, targetReps, targetRPE)
    end

    roundBase = exercise.roundBase
    roundMode = exercise.roundMode
    change = 0
    if metTarget
        if trainingMax < exercise.trainingMax
            change = roundBase
        else
            change =
                round(trainingMax - exercise.trainingMax, roundBase, roundMode)
            change = maximum((change, roundBase))
        end
    else
        if trainingMax < exercise.trainingMax
            change =
                round(exercise.trainingMax - trainingMax, roundBase, roundMode)
            change = -maximum((change, roundBase))
        else
            change =
                round(trainingMax - exercise.trainingMax, roundBase, roundMode)
            change = maximum((change, roundBase))
        end
    end

    return trainingMax, change
end

"""
```
makeDays()
```
Generic function that can be explicitly typed by the user to create their programme's daily schedule. Typed `makeDays` functions are used by [`updateMaxes!`](@ref) to update the training days with the new training maxes calculated by [`adjustMaxes!`](@ref). See the example in [`Programme`](@ref) to see how to define typed `makeDays`.
"""
function makeDays() end

"""
```
updateMaxes!(prog::Programme, names, reps; idx = missing)
```
`names` are the keys of the exercises you want to update, `reps` contains the reps performed at the corresponding exercise's maximum intensity set of the cycle, `idx` is optional in case each entry of reps is a vector and you would like to specifically use an index instead of the last entry.

Updates the programme's training maxes and adjusts the set weights for the next training cycle. It uses [`adjustMaxes`](@ref) to update training maxes and [`makeDays`](@ref) to calculate new set weights according to what is expected by the programme vs actual performance. All this is done on a per exercise basis.

See [`updateMaxes`](@ref) for a non-mutating version of this function.
"""
function updateMaxes!(prog::Programme, names, reps; idx = missing)
    typeof(names) == String ? names = [names] : nothing

    exerProg = prog.exerProg
    for (i, name) in enumerate(names)
        isempty(reps[name]) ? continue : nothing
        ismissing(idx) ? numReps = reps[name][end] : numReps = reps[name][idx]
        numReps < 0 ? continue : nothing
        adjustMaxes!(name, exerProg, numReps)
    end

    prog.days .= makeDays(prog.type, exerProg)
    return prog
end

"""
```
updateMaxes(prog::Programme, names, reps; idx = missing)
```
The arguments are the same as [`updateMaxes!`](@ref).

Calculates the would-be new training maxes and changes to the old training maxes for the next cycle according to what is expected by the programme vs actual performance but does **not** update the programme in any way. Returns a tuple `(trainingMaxes, change)` where each entry in the tuple is an array whose entries correspond 1 to 1 to the exercises in `names`. The new value for `trainingMax` is not necessarily going to equal to the old value of `trainingMax + change`, because `change` is calculated based on how far off the new value for `trainingMax` is from the old value of `trainingMax`, and the result is rounded according to the exercise's `roundBase` and `roundMode`.

This is essentially calls [`adjustMaxes`](@ref) for all the arguments in `names`. In order to see what a programme's training days would look like under these new training maxes, the easiest thing to do is to create a deepcopy() of the programme and run [`updateMaxes!`](@ref) on it.
"""
function updateMaxes(prog::Programme, names, reps; idx = missing)
    typeof(names) == String ? names = [names] : nothing

    trainingMaxes = zeros(length(names))
    change = zeros(length(names))
    exerProg = prog.exerProg
    for (i, name) in enumerate(names)
        isempty(reps[name]) ? continue : nothing
        ismissing(idx) ? numReps = reps[name][end] : numReps = reps[name][idx]
        numReps < 0 ? continue : nothing
        trainingMaxes[i], change[i] = adjustMaxes(name, exerProg, numReps)
    end
    return trainingMaxes, change

end

"""
```
calcTrainingMaxLogs(prog::Programme, names, reps, weight)
```
This function does something similar to [`updateMaxes`](@ref) but for the whole history of entries instead of a single point in time. This is useful for analysing progress.
"""
function calcTrainingMaxLogs(prog::Programme, names, reps, weight)
    typeof(names) == String ? names = [names] : nothing

    trainingMax = deepcopy(weight)
    change = deepcopy(weight)
    for name in names
        isempty(reps[name]) ? continue : nothing
        for j = 1:length(reps[name])
            change[name][j] = 0.0
            trainingMax[name][j] = 0.0
            trainingMax[name][j], change[name][j] = adjustMaxes(
                name,
                prog.exerProg,
                reps[name][j];
                weight = weight[name][j],
            )
        end
    end
    return trainingMax, change
end
