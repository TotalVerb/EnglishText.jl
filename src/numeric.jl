#= Copyright 2015 Fengyang Wang

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License. =#

@reexport module Numeric

export english

const ONES = [
    "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
const TEENS = [
    "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
    "seventeen", "eighteen", "nineteen"]
const TENS = [
    "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty",
    "ninety"]
const POWERS = [
    "thousand", "million", "billion", "trillion", "quadrillion", "quintillion",
    "sextillion", "septillion", "octillion", "nonillion", "decillion",
    "undecillion", "duodecillion", "tredecillion", "quattuordecillion",
    "quindecillion", "sexdecillion", "septendecillion", "octodecillion",
    "novemdecillion", "vigintillion"]


"""Convert \$n\$ to English, given that \$0 < n < 100\$."""
function lth(n::Integer)
    if n < 10
        ONES[n]
    elseif n % 10 == 0
        TENS[n ÷ 10]
    elseif n < 20
        TEENS[n % 10]
    else
        string(TENS[n ÷ 10], '-', ONES[n % 10])
    end
end


"""Convert \$n\$ to English, given that \$0 < n < 1000\$."""
function ltt(n::Integer)
    if n < 100
        lth(n)
    elseif n % 100 == 0
        string(ONES[n ÷ 100], " hundred")
    else
        string(ONES[n ÷ 100], " hundred ", lth(n % 100))
    end
end


"""Convert \$n\$ to English, given that \$0 \\le n < 10^{66}\$."""
function english(n::Integer)
    if n == 0
        "zero"
    else
        result = ASCIIString[]
        segments = digits(n, 1000)
        if segments[1] ≠ 0
            push!(result, ltt(segments[1]))
        end
        for (i, part) in enumerate(segments[2:end])
            if part ≠ 0
                push!(result, POWERS[i], ltt(part))
            end
        end
        join(reverse(result), " ")
    end
end

end  # module Numeric
