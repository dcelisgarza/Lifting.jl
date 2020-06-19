using Documenter, Lifting

import Lifting:
    Lifting_Aux, Lifting_Exercise_Names, Lifting_Progressions, Lifting_Programmes

makedocs(;
    modules = [Lifting],
    format = Documenter.HTML(),
    pages = [
        "Home" => "index.md",
        "IO" => "io.md",
        "Types" => "types.md",
        "Functions & Methods" => "functions.md",
        "Defaults" => "dictionaries.md",
    ],
    repo = "https://github.com/dcelisgarza/Lifting.jl/blob/{commit}{path}#L{line}",
    sitename = "Lifting.jl",
    authors = "Daniel Celis Garza",
    # assets=String[],
)

deploydocs(; repo = "github.com/dcelisgarza/Lifting.jl.git")
