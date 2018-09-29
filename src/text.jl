#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    This file provides utilities for managing (possibly poorly-formatted)
    English text. The intent is not to implement a parser of English, since NLP
    is well beyond the scope of this library, but rather to capture common
    cases.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Text

export sentences

abstract type Sentence end

struct TextSentence <: Sentence
    data::String
end

Base.show(io::IO, sentence::TextSentence) = print(io, sentence.data)

"""
An iterable over the `Sentence`s contained within a block of text. The
iteration over this iterable is guaranteed to be pure and so can be done an
arbitrary number of times.
"""
struct Sentences{T}
    text::T
end

Base.IteratorSize(::Sentences) = Base.SizeUnknown()
Base.iterate(itr::Sentences, ::Nothing) = nothing
function Base.iterate(itr::Sentences, state::Some...)
    buffer = Char[]
    text = itr.text
    next = iterate(text, map(something, state)...)
    while next !== nothing
        c, st = next
        if !isempty(buffer) || !isspace(c)
            push!(buffer, c)
        end
        if c == '.' || c == '!' || c == '?'
            return TextSentence(join(buffer)), Some(st)
        end
        next = iterate(text, st)
    end
    if !isempty(buffer)
        TextSentence(join(buffer)), nothing
    else
        nothing
    end
end

"""
    sentences(text::AbstractString)

Return an iterable over the `Sentence`s contained within `text`. Sentences are
identified naïvely; that is, every full stop, exclamation mark, or question
mark is considered to delimit a sentence. This is of course prone to error, as
some full stops are used for abbreviations and not for delimiting sentences.

```jldoctest
julia> using EnglishText

julia> for s in sentences("Hi! Iterate over sentences. OK?")
           println(s)
       end
Hi!
Iterate over sentences.
OK?
```
"""
sentences(text::AbstractString) = Sentences(text)

end  # module Text

import .Text: sentences
export sentences
