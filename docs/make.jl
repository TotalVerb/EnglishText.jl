using Documenter, EnglishText

makedocs(
    format = :html,
    sitename = "EnglishText.jl",
    authors = "Fengyang Wang",
    analytics = "UA-68884109-1",
    pages = [
        "index.md"
    ]
)

deploydocs(
    julia = "nightly",
    repo   = "github.com/TotalVerb/EnglishText.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing,
)
