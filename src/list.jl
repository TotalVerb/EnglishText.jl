#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm here lists items in the standard way, using commas, spaces,
    and the word "and". There is currently no option to remove the Oxford comma.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

@reexport module ItemLists

export ItemList, Sum, Conjunction, Disjunction

immutable Sum end
immutable Conjunction end
immutable Disjunction end

"""
    ItemList(objects, connective=Sum())

A list of items or adjectives, which supports printing in standard English
format.

```jldoctest
julia> using EnglishText

julia> ItemList(["apples", "oranges"])
apples and oranges

julia> ItemList(["animal", "plant"], Disjunction())
animal or plant

julia> ItemList(["red", "blue", "white"], Conjunction())
red, blue, and white
```
"""
immutable ItemList{T}
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
