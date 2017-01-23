#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    This file provides a Quantity type to describe a number of a countable
    noun. Such objects are printed well, with correct pluralization.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Quantities

using ..Pluralize

export ItemQuantity

immutable ItemQuantity{T <: Integer}
    count::T
    noun::String
end

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

import .Quantities: ItemQuantity
export ItemQuantity
