#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm here lists items in the standard way, using commas, spaces,
    and the word "and". There is currently no option to remove the Oxford comma.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module ItemLists

using ..Semantics

export ItemList, Sum, Conjunction, Disjunction

immutable Sum end
immutable Conjunction end
immutable Disjunction end

# FIXME: used in docs only
import EnglishText

"""
    ItemList(objects, connective=Sum())

A list of items or adjectives, which supports printing in standard English
format. The first argument `objects` should be an iterator over some number of
strings or other objects, including [`EnglishText.ItemQuantity`](@ref) objects.

The second argument `connective` should be one of:

- `Sum()`, which represents a list of nouns in a collection of things
- `Disjunction()`, which represents a list of traits (typically adjectives or
  adverbs, but possibly also verbs or nouns) for which at least one should be
  satisfied
- `Conjunction()`, which represents a list of traits that should all be
  satisfied

If omitted, `connective` is set to `Sum()`.

```jldoctest
julia> using EnglishText

julia> ItemList(["apples", "oranges"])
apples and oranges

julia> ItemList([ItemQuantity(2, "pencil"), ItemQuantity(1, "pen")])
2 pencils and 1 pen

julia> ItemList(["animal", "plant"], Disjunction())
animal or plant

julia> ItemList(["red", "blue", "white"], Conjunction())
red, blue, and white

julia> "Help us $(ItemList(["use", "test"], Conjunction())) this software."
"Help us use and test this software."
```
"""
immutable ItemList{T} <: SemanticText
    objs
    connective::T
end

ItemList(objs) = ItemList(objs, Sum())

identityof(::Sum) = "no objects"
identityof(::Conjunction) = "unremarkable"
identityof(::Disjunction) = "impossible"

wordfor(::Sum) = "and"
wordfor(::Conjunction) = "and"
wordfor(::Disjunction) = "or"

function Base.show(io::IO, list::ItemList)
    objs = collect(list.objs)
    if length(objs) == 0
        print(io, identityof(list.connective))
    elseif length(objs) == 1
        print(io, objs[1])
    elseif length(objs) == 2
        print(io, objs[1], " ", wordfor(list.connective), " ", objs[2])
    elseif length(objs) ≥ 3
        for obj in @view objs[1:end-1]
            print(io, obj, ", ")
        end
        print(io, wordfor(list.connective), " ", objs[end])
    end
end

end

import .ItemLists: ItemList, Sum, Conjunction, Disjunction
export ItemList, Sum, Conjunction, Disjunction
