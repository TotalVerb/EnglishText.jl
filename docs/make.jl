using Documenter, EnglishText

makedocs(
    format = :html,
    sitename = "EnglishText.jl",
    authors = "Fengyang Wang",
    pages = [
        "index.md"
    ]
)

deploydocs(
    repo   = "github.com/TotalVerb/EnglishText.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing,
)
