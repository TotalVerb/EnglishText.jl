#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    This file provides a Quantity type to describe a number of a countable
    noun. Such objects are printed well, with correct pluralization.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Quantities

using ..Pluralize
using ..Semantics

export ItemQuantity, isnothing

"""
    ItemQuantity(n::Integer, item::AbstractString)

Represents a quantity of `n` occurrences of `item`.

```jldoctest
julia> using EnglishText

julia> ItemQuantity(2, "apple")
2 apples

julia> ItemQuantity(1, "standard canine")
1 standard canine
```
"""
immutable ItemQuantity <: SemanticText
    count::Int
    noun::String
end

"""
    isnothing(quantity::ItemQuantity)

Return `true` if the given `ItemQuantity` represents no items.
"""
isnothing(quantity::ItemQuantity) = quantity.count == 0

function Base.show(io::IO, quantity::ItemQuantity)
    print(io, quantity.count)
    print(io, " ")
    if quantity.count == 1
        print(io, quantity.noun)
    else
        print(io, pluralize(quantity.noun))
    end
end

end

import .Quantities: ItemQuantity, isnothing
export ItemQuantity, isnothing
