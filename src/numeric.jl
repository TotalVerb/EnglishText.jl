#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm used here only works up to vigintillions. Beyond that, it is
    difficult to find consensus on how numbers should be displayed. It is also
    of dubious real-world utility.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Numeric

export english, unenglish

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

function reverse_word_lookup(ones, teens, tens)
    result = Dict{String, Int}()
    for (i, o) in enumerate(ones)
        result[o] = i
    end
    for (i, o) in enumerate(teens)
        result[o] = 10 + i
    end
    for (i, o) in enumerate(tens)
        result[o] = i * 10
    end
    result
end

function reverse_power_lookup(powers)
    result = Dict{String, Int}()
    for (i, o) in enumerate(powers)
        result[o] = 3i
    end
    result
end

const REVERSE_WORD = reverse_word_lookup(ONES, TEENS, TENS)
const REVERSE_POWER = reverse_power_lookup(POWERS)

"""
Convert ``n`` to English, given that ``0 < n < 100``.
"""
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


"""
Convert ``n`` to English, given that ``0 < n < 1000``.
"""
function ltt(n::Integer)
    if n < 100
        lth(n)
    elseif n % 100 == 0
        string(ONES[n ÷ 100], " hundred")
    else
        string(ONES[n ÷ 100], " hundred ", lth(n % 100))
    end
end


"""
    english(n::Integer)

Convert ``n`` to English, given that ``0 \\le n < 10^{66}``.

```jldoctest
julia> using EnglishText

julia> english(16)
"sixteen"
```
"""
function english(n::Integer)
    if n == 0
        "zero"
    else
        result = String[]
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

"""
    unenglish(T <: Integer, data::AbstractString) → T

Convert `data` to an integral type. This function has the guarantee that
`unenglish(Int, english(x)) == x`, modulo any type differences. It is not
guaranteed to work well or throw exceptions on other inputs.

```jldoctest
julia> using EnglishText

julia> unenglish(Int, "sixteen")
16
```
"""
function (unenglish(::Type{T}, data::AbstractString)::T) where T <: Integer
    words = split(data)
    bigpart::T = zero(T)
    smallpart::T = zero(T)
    for word in words
        pieces = split(word, '-')
        for piece in pieces
            piece = lowercase(piece)
            if haskey(REVERSE_WORD, piece)
                smallpart += REVERSE_WORD[piece]
            elseif piece == "hundred"
                smallpart *= 100
            elseif haskey(REVERSE_POWER, piece)
                bigpart += T(10) ^ REVERSE_POWER[piece] * smallpart
                smallpart = zero(T)
            end
        end
    end
    bigpart + smallpart
end

end  # module Numeric

import .Numeric: english, unenglish
export english, unenglish
