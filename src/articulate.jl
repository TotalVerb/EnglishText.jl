#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The article data (see /data/articles.json) and algorithm to parse it are
    taken from AvsAn by Eamon Nerbonne, licensed under the Apache License 2.0.

    For more details about the AvsAn project, see
    <https://github.com/EamonNerbonne/a-vs-an>.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Articulate

export indefinite

using JSON
using Compat

const RAW_DATA = JSON.parsefile(
    joinpath(dirname(@__DIR__), "data", "articles.json"))

@enum Article a an

type ArticleTable
    article::Article
    prefixes::Dict{Char, ArticleTable}
end

function process(rawdata, default)
    pd = ArticleTable(default, Dict())
    if haskey(rawdata, "article")
        pd.article = rawdata["article"] == "a" ? a : an
    end
    for (c, v) in rawdata
        if c ≠ "article"
            @assert length(c) == 1
            pd.prefixes[c[1]] = process(v, pd.article)
        end
    end
    pd
end

const PROCESSED_DATA = process(RAW_DATA, a)

"""
    indefinite(word)

Determine the correct indefinite article, from “a” or “an”, for the given noun.

```jldoctest
julia> using EnglishText

julia> indefinite("hour")
"an"

julia> indefinite("hand")
"a"
```
"""
function indefinite(word, table=PROCESSED_DATA)
    if isempty(word)
        table.article |> string
    else
        f, r = first(word), word[nextind(word, 1):end]
        if haskey(table.prefixes, f)
            indefinite(r, table.prefixes[f])
        else
            table.article |> string
        end
    end
end

end  # module Articulate

import .Articulate: indefinite
export indefinite
