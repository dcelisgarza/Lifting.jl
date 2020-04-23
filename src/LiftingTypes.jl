"""
Lifting Types.
"""
abstract type AbstractProgression end
struct LinearProgression <: AbstractProgression end
struct DoubleProgression <: AbstractProgression end
struct PeriodProgression <: AbstractProgression end
struct BlockProgression <: AbstractProgression end

import Base: round, length, getindex, iterate, @_inline_meta
round(x::Real, y::Real, mode::Function = floor) = mode(x / y) * y
length(x::Function) = 1

function calcIntensity(reps::Integer, rpe::Real = 10)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    return minimum((1 / (a + b * (reps + 10 - rpe) + (reps - 1) * (c / reps + d / rpe)),1.0))
end

function calcRPE(reps::Integer, intensity::Real)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    intensity = minimum((intensity, 1.0))
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

    return minimum((rpe, 10.))
end

function calcReps(intensity::Real, rpe::Real)
    a = 0.995
    b = 0.0333
    c = 0.0025
    d = 0.1
    intensity = minimum((intensity, 1.))
    rpe = minimum((rpe, 10.))
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

function calcIntensityRatio(
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)
    actualRPE = minimum((actualRPE, 10.))
    targetRPE = minimum((targetRPE, 10.))

    actualIntensity = calcIntensity(actualReps, actualRPE)
    targetIntensity = calcIntensity(targetReps, targetRPE)
    return targetIntensity / actualIntensity
end

function calcRepRatio(
    actualIntensity::Real,
    actualRPE::Real,
    targetIntensity::Real,
    targetRPE::Real,
)
    actualIntensity = minimum((actualRPE, 1.))
    targetIntensity = minimum((targetRPE, 1.))
    actualRPE = minimum((actualRPE, 10.))
    targetRPE = minimum((targetRPE, 10.))

    actualReps = calcReps(actualIntensity, actualRPE)
    targetReps = calcReps(targetIntensity, targetRPE)
    return targetReps / actualReps
end

function calcRPERatio(
    actualReps::Integer,
    actualIntensity::Real,
    targetReps::Integer,
    targetIntensity::Real,
)
    actualIntensity = minimum((actualRPE, 1.))
    targetIntensity = minimum((targetRPE, 1.))

    actualRPE = calcRPE(actualReps, actualIntensity)
    targetRPE = calcRPE(targetReps, targetIntensity)
    return targetRPE / actualRPE
end

function calcRepMax(
    weight::Real,
    actualReps::Integer,
    actualRPE::Real,
    targetReps::Integer,
    targetRPE::Real,
)

    actualRPE = minimum((actualRPE, 10.))
    targetRPE = minimum((targetRPE, 10.))

    intensity = calcIntensityRatio(actualReps, actualRPE, targetReps, targetRPE)
    return weight * intensity
end


function intensityArb(var::Integer)
    return 1 / (0.995 + (0.0333 * var))
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
mutable struct Progression{
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
"""
mutable struct Progression{
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
        sessions::T3,
        period::T3,
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
struct Exercise{
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
        equipment::T2 = "Barbell",
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
struct Programme{T1 <: AbstractString, T2 <: Any}
    name::T1
    days::T2
end
```
"""
mutable struct Programme{T1 <: AbstractString, T2 <: Dict{Any, Any}, T3 <: Any}
    name::T1
    dict::T2
    days::T3


    function Programme(
        name::T1,
        dict::T2,
        days::T3,
    ) where {T1 <: AbstractString, T2 <: Dict{Any, Any}, T3 <: Any}

        new{typeof(name), typeof(dict), typeof(days)}(name, dict, days)
    end
end

getindex(p::Programme, idx...) = [p.days[i] for i in idx]
getindex(p::Programme, i) = p.days[i]

import Base: push!
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

function updateRepMax(
    name::String,
    dict::Dict{Any, Any},
    actualReps::Integer
)
    entry = dict[name]
    exercise = entry[1]
    prog = entry[2]
    setScheme = prog.setScheme
    numSets = length(setScheme)

    idx1 = 0
    idx2 = 0
    tmp = 0.
    old = 0.
    maxWght = 0
    for i = 1:numSets
        old = tmp
        wght = setScheme[i].wght
        tmp = maximum(wght)
        maxWght = maximum((tmp, maxWght))
        if maxWght > old
            idx1 = i
            idx2 = findfirst(x -> x == maxWght, wght)
        end
    end

    targetReps = setScheme[idx1].reps[idx2]
    targetIntensity = setScheme[idx1].intensity[idx2]
    targetRPE = calcRPE(targetReps, targetIntensity)
    actualRPE = calcRPE(actualReps, targetIntensity)
    flag = targetRPE<=actualRPE
    actualRPE = 2*targetRPE - actualRPE

    trainingMax = calcRepMax(
        maxWght,
        actualReps,
        actualRPE,
        targetReps,
        targetRPE
    )
    roundBase = exercise.roundBase
    if flag
        if trainingMax < exercise.trainingMax
            exercise.trainingMax += roundBase
            calcWeights(exercise, prog)
        else
            change = div(trainingMax - exercise.trainingMax, roundBase)
            change = maximum((change, roundBase))
            exercise.trainingMax += change
            calcWeights(exercise, prog)
        end
    else
        if trainingMax < exercise.trainingMax
            change = div(exercise.trainingMax - trainingMax, roundBase)
            change = maximum((change, roundBase))
            exercise.trainingMax -= change
            calcWeights(exercise, prog)
        else
            change = div(trainingMax - exercise.trainingMax, roundBase)
            change = maximum((change, roundBase))
            exercise.trainingMax += change
            calcWeights(exercise, prog)
        end
    end
end
