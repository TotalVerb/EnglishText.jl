@testset "List" begin

@testset "Sum" begin
    @test string(ItemList([])) == "no objects"
    @test string(ItemList(["apples"])) == "apples"
    @test string(ItemList(["apples", "oranges"])) == "apples and oranges"
    @test string(ItemList(["apples", "oranges", "grapefruit"])) ==
        "apples, oranges, and grapefruit"
    @test string(ItemList(english.(1:5))) == "one, two, three, four, and five"
end

@testset "Conjunction" begin
    @test string(ItemList([], Conjunction())) == "unremarkable"
    @test string(ItemList(["red"], Conjunction())) == "red"
    @test string(ItemList(["red", "blue"], Conjunction())) == "red and blue"
    @test string(ItemList(["red", "blue", "yellow"], Conjunction())) ==
        "red, blue, and yellow"
end

@testset "Disjunction" begin
    @test string(ItemList([], Disjunction())) == "impossible"
    @test string(ItemList(["red"], Disjunction())) == "red"
    @test string(ItemList(["red", "blue"], Disjunction())) == "red or blue"
    @test string(ItemList(["red", "blue", "yellow"], Disjunction())) ==
        "red, blue, or yellow"
    @test string(ItemList(english.(1:5), Disjunction())) ==
        "one, two, three, four, or five"
end

end
