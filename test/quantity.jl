@testset "Quantities" begin

@testset "Singular" begin
    @test string(ItemQuantity(1, "apple")) == "1 apple"
    @test string(ItemQuantity(1, "web page")) == "1 web page"
    @test string(ItemQuantity(1, "Julia library")) == "1 Julia library"
end

@testset "Plural" begin
    @test string(ItemQuantity(2, "apple")) == "2 apples"
    @test string(ItemQuantity(3, "web page")) == "3 web pages"
    @test string(ItemQuantity(0, "Julia library")) == "0 Julia libraries"
end

@testset "Collection-like Interface" begin
    @test length(ItemQuantity(0, "human")) == 0
    @test length(ItemQuantity(4, "line")) == 4
    @test isempty(ItemQuantity(0, "train"))
    @test !isempty(ItemQuantity(1, "train"))
end

end
