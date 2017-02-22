@testset "Int → Eng" begin
    @test english(0) == "zero"
    @test english(1) == "one"
    @test english(2) == "two"
    @test english(9) == "nine"
    @test english(10) == "ten"
    @test english(11) == "eleven"
    @test english(19) == "nineteen"
    @test english(20) == "twenty"
    @test english(21) == "twenty-one"
    @test english(29) == "twenty-nine"
    @test english(30) == "thirty"
    @test english(99) == "ninety-nine"
    @test english(100) == "one hundred"
    @test english(101) == "one hundred one"
    @test english(111) == "one hundred eleven"
    @test english(199) == "one hundred ninety-nine"
    @test english(200) == "two hundred"
    @test english(999) == "nine hundred ninety-nine"
    @test english(1000) == "one thousand"
    @test english(1001) == "one thousand one"
    @test english(1100) == "one thousand one hundred"
    @test english(1999) == "one thousand nine hundred ninety-nine"
    @test english(2000) == "two thousand"
    @test english(10000) == "ten thousand"
    @test english(805097) == "eight hundred five thousand ninety-seven"
    @test english(999999) ==
        "nine hundred ninety-nine thousand nine hundred ninety-nine"
    @test english(1000000) == "one million"
    @test english(1000001) == "one million one"
    @test english(1001000) == "one million one thousand"
    @test english(1001001) == "one million one thousand one"
    @test english(800000005) == "eight hundred million five"
    @test english(1000000000) == "one billion"
    @test english(BigInt(10)^21) == "one sextillion"
    @test english(BigInt(10)^63) == "one vigintillion"
end

@testset "Int ← Eng" begin
    for T in [Int8, Int16, Int32, Int64, Int128,
              UInt8, UInt16, UInt32, UInt64, UInt128, Bool]
        @test unenglish(T, english(0))::T == 0
        @test unenglish(T, english(typemax(T)))::T == typemax(T)
    end

    for i in 0:10
        @test unenglish(Int, english(i)) == i
    end

    for i in 100:37:900
        @test unenglish(Int, english(i)) == i
    end

    for i in 3:8
        @test unenglish(Int, english(10^i)) == 10^i
        @test unenglish(Int, english(10^i + 85)) == 10^i + 85
    end

    for i in 9:63
        @test unenglish(BigInt, english(big(10)^i)) == big(10)^i
        @test unenglish(BigInt, english(big(10)^i - 85)) == big(10)^i - 85
    end
end
