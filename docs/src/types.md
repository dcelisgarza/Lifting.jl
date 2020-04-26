# Types

The generalised framework for this package leans heavily on Julia's type system.

## Primitive Types

The abstract progression types let users create specialised functions.
```@docs
AbstractProgression
AbstractProgramme
```

## Structures

In order to create programmes we need to create a set scheme. This is done via the [`SetScheme`](@ref) structure.
```@docs
SetScheme
```

After creating our desired set schemes we use them to create a progression.
```@docs
Progression
```

We also need to create an exercise.
```@docs
Exercise
```

Finally, we create a programme using the following structure.
```@docs
Programme
```
