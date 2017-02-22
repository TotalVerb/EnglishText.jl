#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm and rules used for unpluralizing English words was originated
    by the Inflector .NET project, and is copyright Andrew Peters, Scott
    Kirkland and other contributors. It is made available under the MIT
    license. Modifications may have been made to the original algorithm.

    The Inflector .NET is hosted on GitHub at the following URL
    <https://github.com/srkirkland/Inflector>
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

export singularize

const SINGULARIZE_RULES = [
    r"geese$"               => s"goose",
    r"feet$"                => s"foot",
    r"men$"                 => s"man",
    r"moves$"               => s"move",
    r"monies$"              => s"money",
    r"matrices$"            => s"matrix",
    r"i$"                   => s"us",
    r"ae$"                  => s"a",
    r"podes$"               => s"pus",
    r"(qu|wh)izzes$"        => s"\1iz",
    r"zes"                  => s"z",
    r"(vert|ind)ices$"      => s"\1ex",
    r"(cris|ax|test)es$"    => s"\1is",
    r"shoes$"               => s"shoe",
    r"oes$"                 => s"o",
    r"([ml])ice$"           => s"\1ouse",
    r"(x|ch|ss|sh)es$"      => s"\1",
    r"movies$"              => s"movie",
    r"([^aeiouy]|qu)ies$"   => s"\1y",
    r"([lr])ves$"           => s"\1f",
    r"([ht])ives$"          => s"\1ive",
    r"([^f])ves$"           => s"\1fe",
    r"[us]ses$"             => s"us",
    r"ses$"                 => s"sis",
    r"([ti])a$"             => s"\1um",
    r"s$"                   => s""]

"""
    singularize(word)

Unpluralize a plural noun (given in canonical capitalization) using heuristics
and lists of exceptions. If the given `word` is not a plural noun, the result
may be unpredictable.

```jldoctest
julia> using EnglishText

julia> singularize("foxes")
"fox"

julia> singularize("data")
"datum"
```
"""
function singularize(s::String)
    # irregular words
    for (singular, plural) in IRREGULAR_CLS
        if plural == s
            return singular
        end
    end
    # words that do not inflect
    if isnoninflecting(s, true) || isnoninflecting(s, false)
        return s
    end
    # singular words ending in s
    if endswith(s, "ses")
        chopped = stem(s, 2, "")
        if chopped ∈ SINGLE_S
            return chopped
        end
    end
    for (regex, subst) ∈ SINGULARIZE_RULES
        if ismatch(regex, s)
            return replace(s, regex, subst)
        end
    end
    s
end
singularize(s::AbstractString) = singularize(String(s))
