#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    This file provides a Quantity type to describe a number of a countable
    noun. Such objects are printed well, with correct pluralization.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Quantities

using ..Pluralize
using ..Semantics
import Base: isempty, length

export ItemQuantity, isnothing

"""
    ItemQuantity(n::Integer, item::AbstractString)

Represents a quantity of `n` occurrences of `item`. Although this is not a
collection, for ease of use, it implements some of the standard collection
methods `length` (for number of items) and `isempty` (for whether there are no
items).

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
    isempty(quantity::ItemQuantity)

Return `true` if the given `ItemQuantity` represents no items.

```jldoctest
julia> using EnglishText

julia> isempty(ItemQuantity(0, "orange"))
true

julia> isempty(ItemQuantity(4, "person"))
false
```
"""
isempty(quantity::ItemQuantity) = quantity.count == 0

"""
    length(quantity::ItemQuantity)

Return the number of items represented by this quantity.

```jldoctest
julia> using EnglishText

julia> length(ItemQuantity(7, "desk"))
7
```
"""
length(quantity::ItemQuantity) = quantity.count

function Base.show(io::IO, quantity::ItemQuantity)
    print(io, quantity.count)
    print(io, " ")
    if quantity.count == 1
        print(io, quantity.noun)
    else
        print(io, pluralize(quantity.noun))
    end
end

Base.@deprecate_binding isnothing isempty

end

import .Quantities: ItemQuantity, isnothing
export ItemQuantity, isnothing
