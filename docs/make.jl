using Documenter, Lifting

makedocs(;
    modules=[Lifting],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "IO" => "io.md",
        "Types" => "types.md",
        "Functions & Methods" => "functions.md"
    ],
    repo="https://github.com/dcelisgarza/Lifting.jl/blob/{commit}{path}#L{line}",
    sitename="Lifting.jl",
    authors="Daniel Celis Garza",
    # assets=String[],
)

deploydocs(;
    repo="github.com/dcelisgarza/Lifting.jl.git",
)