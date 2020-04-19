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

function intensity(reps::Integer, rpe::Real = 10)
    return 1 / (0.995 + reps / (3 * rpe))
end

function RPE(reps::Integer, intensity::Real)
    return reps / (3 * (1 / intensity - 0.995))
end

function intensityArb(var::Integer)
    return 1 / (0.995 + (0.0333 * var))
end

"""
```
struct SetScheme{
    T1 <: Vector{<:AbstractString},
    T2 <: Vector{<:Integer},
    T3 <: Vector{<:Real},
    T4 <: Vector{<:Function},
}
    type::T1
    sets::T2
    reps::T2
    intensity::T3
    addWeight::T3
    roundMode::T4
    setWeight::T3
end
```
"""
struct SetScheme{
    T1 <: Vector{<:AbstractString},
    T2 <: Vector{<:Integer},
    T3 <: Vector{<:Real},
    T4 <: Vector{<:Function},
}
    type::T1
    sets::T2
    reps::T2
    intensity::T3
    rpe::T3
    addWeight::T3
    roundMode::T4
    setWeight::T3

    function SetScheme(;
        type::T1,
        sets::T2,
        reps::T2,
        intensity::T3,
        addWeight::T4 = zeros(length(intensity)),
        roundMode::T5 = fill(floor, length(intensity)),
        rpeMode::Bool = false,
    ) where {
        T1 <: Vector{<:AbstractString},
        T2 <: Vector{<:Integer},
        T3 <: Vector{<:Real},
        T4 <: Vector{<:Real},
        T5 <: Vector{<:Function},
    }
        @assert length(sets) ==
                length(reps) ==
                length(intensity) ==
                length(addWeight) ==
                length(roundMode) "lengths of sets $(length(sets)), reps $(length(reps)), intensity $(length(intensity)), addWeight $(length(addWeight)) and roundMode $(length(roundMode)) must be equal."

        rpe = zeros(length(intensity))
        if rpeMode
            rpe = intensity
            intensity = intensity.(reps, intensity)
        else
            rpe = RPE.(reps, intensity)
        end
        setWeight = zeros(length(sets))

        new{typeof(type), typeof(sets), typeof(intensity), typeof(roundMode)}(
            type,
            sets,
            reps,
            intensity,
            rpe,
            convert.(eltype(intensity), addWeight),
            roundMode,
            setWeight,
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

    function Exercise(;
        name::T1,
        equipment::T2,
        modality::T3,
        muscles::T4,
        trainingMax::T6,
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
    setScheme.setWeight .=
        round.(trainingMax * intensity + addWeight, roundBase, roundMode)

    # Calculate target minimum RPE for a set.
    intense = setScheme.setWeight / trainingMax
    setScheme.rpe .= RPE.(reps, intense)

    return setScheme
end

"""
```
struct Programme{
    T1 <: AbstractString,
    T2 <: Union{<:Exercise, Vector{<:Exercise}},
    T3 <: Union{<:Progression, Vector{<:Progression}},
}
    name::T1
    exercise::T2
    progression::T3
end
```
"""
struct Programme{
    T1 <: AbstractString,
    T2 <: Union{<:Exercise, Vector{<:Exercise}},
    T3 <: Union{<:Progression, Vector{<:Progression}},
}
    name::T1
    exercise::T2
    progression::T3

    function Programme(
        name::T1,
        exercise::T2,
        progression::T3,
    ) where {
        T1 <: AbstractString,
        T2 <: Union{<:Exercise, Vector{<:Exercise}},
        T3 <: Union{<:Progression, Vector{<:Progression}},
    }
        @assert length(exercise) == length(progression) "$(name): the number of exerices, $(length(exercise)), must equal the number of progressions, $(length(progression))"

        for i = 1:length(exercise)
            calcWeights.(exercise[i], progression[i].setScheme)
        end

        new{typeof(name), typeof(exercise), typeof(progression)}(
            name,
            exercise,
            progression,
        )
    end
end
