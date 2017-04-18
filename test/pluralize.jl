const UNIVERSAL_PLURALS = [
    "afreet" => "afreets",
    "agency" => "agencies",
    "bacterium" => "bacteria",
    "bias" => "biases",
    "bison" => "bison",
    "child" => "children",
    "child-in-law" => "children-in-law",
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
    "moose" => "moose",
    "mother-in-law" => "mothers-in-law",
    "macro" => "macros",
    "neo" => "neos",
    "phenomenon" => "phenomena",
    "pig" => "pigs",
    "sex" => "sexes",
    "suffix" => "suffixes",    # "suffices" not standard Latin
    "tomato" => "tomatoes",
    "topaz" => "topazes",
    "unicorn" => "unicorns",
    "quiz" => "quizzes",
    "Javanese" => "Javanese",
    "Major General" => "Major Generals",
    "Postmaster General" => "Postmasters General"]

const CLASSICAL_PLURALS = [
    "beau" => "beaux",
    "cactus" => "cacti",
    "cow" => "kine",
    "focus" => "foci",
    "formula" => "formulae",
    "genius" => "genii",
    "iris" => "irides",
    "larynx" => "larynges",
    "lemma" => "lemmata",
    "lumen" => "lumina",
    "matrix" => "matrices",
    "milieu" => "milieux",
    "money" => "monies",
    "octopus" => "octopodes",  # "octopi" not standard Latin
    "seraph" => "seraphim",
    "soprano" => "soprani",
    "vertex" => "vertices"]

# classical plurals not expected to be handled by singularize
const EXTRA_CLASSICAL_PLURALS = [
    "thee" => "ye",
    "thou" => "ye"
]

const MODERN_PLURALS = [
    "beau" => "beaus",
    "cactus" => "cactuses",
    "cow" => "cows",
    "focus" => "focuses",
    "formula" => "formulas",
    "genius" => "geniuses",
    "iris" => "irises",
    "larynx" => "larynxes",
    "lemma" => "lemmas",
    "lumen" => "lumens",
    "matrix" => "matrixes",
    "milieu" => "milieus",
    "money" => "moneys",
    "octopus" => "octopuses",
    "seraph" => "seraphs",
    "soprano" => "sopranos",
    "vertex" => "vertexes"]

@testset "Pluralize" begin
    @testset for (singular, plural) in UNIVERSAL_PLURALS
        @test pluralize(singular, classical=true) == plural
        @test pluralize(singular, classical=false) == plural
    end
    @testset for (singular, plural) in [CLASSICAL_PLURALS;
                                        EXTRA_CLASSICAL_PLURALS]
        @test pluralize(singular, classical=true) == plural
    end
    @testset for (singular, plural) in MODERN_PLURALS
        @test pluralize(singular, classical=false) == plural
    end

    # invalid arguments currently throw — but we need to decide if this is
    # actually a good idea — it might be safer just to return the string
    # untouched
    @test_throws ArgumentError pluralize("")

    # currently we tolerate trailing whitespace, but what we return does not
    # have it — this is again a decision we should rethink
    @test pluralize("bar ") == "bars"

    # check that it works with a different string type
    # in this case, SubString
    @test pluralize(split("Julia language")[2]) == "languages"
end

@testset "Singularize" begin
    @testset for (singular, plural) in [UNIVERSAL_PLURALS;
                                        CLASSICAL_PLURALS;
                                        MODERN_PLURALS]
        @test singularize(plural) == singular
    end

    # we can't sensibly singularize words without singular forms; the most
    # sensible thing is to return the argument unchanged
    @test singularize("sand") == "sand"

    # check that it works with a different string type
    @test singularize(split("programming languages")[2]) == "language"
end
