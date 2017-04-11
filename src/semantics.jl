module Semantics

export SemanticText

using Compat

"""
An object representing a string of text but with additional semantic
information. These objects convert to `String`s through the `string` function,
but also typically support other operations.
"""
@compat abstract type SemanticText end

end

using .Semantics: SemanticText
export SemanticText
