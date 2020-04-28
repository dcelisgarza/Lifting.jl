# Defaults

```julia
function ishappy(me::Person, circumstance!::Function, happy::Bool=true, args...; kwargs...)
    circumstance!(me, args...; kwargs...)
    me.happyIndexChange > 0 ? return happy : return !happy
end
```

## Dictionaries

> Dictionary, n. A malevolent literacy device for cramping the growth of a language and making it hard and inelastic.
> - Ambrose Bierce on the evils of dictionaries

We've define a set of default dictionaries to make life easier and standardise the extra information users may want to add to their exercises and set schemes. These dictionaries can be expanded by the users using the `push!()` and `insert!()` intrinsics. Pull requests adding more entries to the defaul dictionaries are always welcome.
!!! note
    None of these dictionaries are explicitly exported by `Lifting.jl`. Use them with the `Lifting.` prefix or import them explicitly.
```@docs
Lifting_Aux
Lifting_Exercise_Names
Lifting_Progressions
Lifting_Programmes
```
