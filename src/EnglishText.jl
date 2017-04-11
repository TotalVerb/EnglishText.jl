__precompile__()

module EnglishText

# code to text
include("semantics.jl")
include("articulate.jl")
include("list.jl")
include("numeric.jl")
include("pluralize.jl")
include("quantity.jl")

# text to code
include("text.jl")

end # module
