"""
```
Lifting_Programmes::Dict{String, Programme}
```
Dictionary with preloaded programmes. These are the programmes I've created and added to the dictionary.

```
julia> import Lifting: Lifting_Programmes
julia> keys(Lifting_Programmes)
Base.KeySet for a Dict{String,Programme} with 1 entry. Keys:
  "nSunsCAP3_OHP_6Day_LP"
```
"""
Lifting_Programmes = Dict{String, Programme}()

include("nSunsCAP3_OHP_6Day_LP.jl")
