using Compat
using EnglishText

using Test

@testset "Articles" begin
    @test indefinite("pig") == "a"
    @test indefinite("iron") == "an"
    @test indefinite("unicorn") == "a"
    @test indefinite("honest") == "an"
    @test indefinite("honey") == "a"
    @test indefinite("NATO") == "a"
    @test indefinite("NSA") == "an"
end

include("numeric.jl")
include("pluralize.jl")
include("list.jl")
include("text.jl")
include("quantity.jl")
