# English

[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://totalverb.github.io/English.jl/stable)
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://totalverb.github.io/English.jl/latest)
[![Build Status](https://travis-ci.org/TotalVerb/English.jl.svg?branch=master)](https://travis-ci.org/TotalVerb/English.jl)

Currently this package includes six features:

 - `indefinite` for finding the right indefinite article to use
 - `english` for converting a positive integer to an English-language wordy
   representation, and the inverse function `unenglish` to convert the wordy
   representation back.
 - `pluralize` to pluralize a noun
 - `ItemList` to create a list of objects
 - `ItemQuantity` to associate a noun with a number
 - `sentences` to iterate over the sentences of a text

```julia
julia> using English

julia> indefinite("hour")
"an"

julia> indefinite("hand")
"a"

julia> english(16)
"sixteen"

julia> unenglish(Int, "sixteen")
16

julia> pluralize("fox")
"foxes"

julia> ItemList(["apples", "oranges"])
apples and oranges

julia> ItemList(["animal", "plant"], Disjunction())
animal or plant

julia> ItemQuantity(2, "apple")
2 apples

julia> ItemQuantity(1, "standard canine")
1 standard canine

julia> for s in sentences("Hi! Iterate over sentences. OK?")
           println(s)
       end
```
