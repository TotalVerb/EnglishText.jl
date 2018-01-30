@testset "Text" begin

@testset "sentences" begin
    @test [string(x) for x = sentences("Hello, world!")] ==
            ["Hello, world!"]
    @test [string(x) for x = sentences("Hello. This is a test.")] ==
            ["Hello.", "This is a test."]
    @test [string(x) for x = sentences(
            "Do question marks work? Yes, they do.")] ==
            ["Do question marks work?", "Yes, they do."]

    mobydick = replace(
        read(joinpath(dirname(@__DIR__), "text", "mobydick.txt"), String),
        "\n" => " ")
    result = [string(x) for x = sentences(mobydick)]
    @test result[1] == "Call me Ishmael."
    @test result[2] == string(
        "Some years ago — never mind how long precisely — having little or ",
        "no money in my purse, and nothing particular to interest me on ",
        "shore, I thought I would sail about a little and see the watery ",
        "part of the world.")
    @test result[end] == string(
        "If they but knew it, almost all men in their degree, some time or ",
        "other, cherish very nearly the same feelings towards the ocean ",
        "with me.")

    # test ending without punctuation
    @test [string(x) for x = sentences("Look! It's Iron Man")] ==
        ["Look!", "It's Iron Man"]
end

end
