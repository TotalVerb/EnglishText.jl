# English

[![Build Status](https://travis-ci.org/TotalVerb/English.jl.svg?branch=master)](https://travis-ci.org/TotalVerb/English.jl)

Currently this package includes a single feature: `indefinite` for finding the
right indefinite article to use.

```julia
julia> using English

julia> indefinite("hour")
"an"

julia> indefinite("hand")
"a"
```
