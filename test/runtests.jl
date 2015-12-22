#= Copyright 2015 Fengyang Wang

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License. =#

using English
using Base.Test

@testset "Articles" begin
    @test indefinite("pig") == "a"
    @test indefinite("iron") == "an"
    @test indefinite("unicorn") == "a"
    @test indefinite("honest") == "an"
    @test indefinite("honey") == "a"
    @test indefinite("NATO") == "a"
    @test indefinite("NSA") == "an"
end

@testset "Numeric" begin
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
