using Documenter, English

makedocs(
    format = :html,
    sitename = "English.jl",
    authors = "Fengyang Wang",
    pages = [
        "index.md"
    ]
)

deploydocs(
    repo   = "github.com/TotalVerb/English.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing,
)
