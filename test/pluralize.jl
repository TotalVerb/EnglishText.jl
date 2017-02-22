const UNIVERSAL_PLURALS = [
    "agency" => "agencies",
    "bacterium" => "bacteria",
    "bias" => "biases",
    "bison" => "bison",
    "child" => "children",
    "corps" => "corps",
    "datum" => "data",
    "deer" => "deer",
    "diagnosis" => "diagnoses",
    "die" => "dice",
    "elf" => "elves",
    "fish" => "fish",
    "fizz" => "fizzes",
    "foot" => "feet",
    "gas" => "gases",
    "goose" => "geese",
    "graffito" => "graffiti",
    "iron" => "irons",
    "louse" => "lice",
    "man" => "men",
    "macro" => "macros",
    "pig" => "pigs",
    "sex" => "sexes",
    "suffix" => "suffixes",    # "suffices" not standard Latin
    "topaz" => "topazes",
    "unicorn" => "unicorns",
    "quiz" => "quizzes"]

const CLASSICAL_PLURALS = [
    "cactus" => "cacti",
    "cow" => "kine",
    "focus" => "foci",
    "formula" => "formulae",
    "genius" => "genii",
    "money" => "monies",
    "octopus" => "octopodes",  # "octopi" not standard Latin
    "vertex" => "vertices"]

const MODERN_PLURALS = [
    "cactus" => "cactuses",
    "cow" => "cows",
    "focus" => "focuses",
    "formula" => "formulas",
    "genius" => "geniuses",
    "money" => "moneys",
    "octopus" => "octopuses",
    "vertex" => "vertexes"]

@testset "Pluralize" begin
    @testset for (singular, plural) in UNIVERSAL_PLURALS
        @test pluralize(singular, classical=true) == plural
        @test pluralize(singular, classical=false) == plural
    end
    @testset for (singular, plural) in CLASSICAL_PLURALS
        @test pluralize(singular, classical=true) == plural
    end
    @testset for (singular, plural) in MODERN_PLURALS
        @test pluralize(singular, classical=false) == plural
    end
end

@testset "Singularize" begin
    @testset for (singular, plural) in [UNIVERSAL_PLURALS;
                                        CLASSICAL_PLURALS;
                                        MODERN_PLURALS]
        @test singularize(plural) == singular
    end
end
