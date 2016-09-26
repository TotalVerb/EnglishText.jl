immutable SuffixNode{T}
    value::T
    character::Char
    children::Dict{Char, SuffixNode{T}}
end

immutable SuffixTree{T}
    value::T
    children::Dict{Char, SuffixNode{T}}
end

hassuffix(x, y) = 

function buildtree{T}(words::Associative{T, T})

end

function buildnode{T}(suffix::T, words::Associative{T, T})

end
