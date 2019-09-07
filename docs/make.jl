using Documenter, EnglishText

makedocs(;
    modules  = [EnglishText],
    format   = Documenter.HTML(analytics = "UA-68884109-1"),
    pages    = [
        "Home" => "index.md",
    ],
    repo     = "https://github.com/TotalVerb/EnglishText.jl/blob/{commit}{path}#L{line}",
    sitename = "EnglishText.jl",
    authors  = "Fengyang Wang",
    assets   = [],
)

deploydocs(
    repo = "github.com/TotalVerb/EnglishText.jl",
)
