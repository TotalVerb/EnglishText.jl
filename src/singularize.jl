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
    r"moves$"               => s"move",
    r"monies$"              => s"money",
    r"matrices$"            => s"matrix",
    r"([io])rides$"         => s"\1ris",
    r"podes$"               => s"pus",
    r"(qu|wh)izzes$"        => s"\1iz",
    r"zes"                  => s"z",
    r"(vert|ind)ices$"      => s"\1ex",
    r"(cris|ax|test)es$"    => s"\1is",
    r"shoes$"               => s"shoe",
    r"oes$"                 => s"o",
    r"([ml])ice$"           => s"\1ouse",
    r"([iay])nges$"         => s"\1nx",
    r"(x|ch|ss|sh)es$"      => s"\1",
    r"movies$"              => s"movie",
    r"([^aeiouy]|qu)ies$"   => s"\1y",
    r"([lr])ves$"           => s"\1f",
    r"([ht])ives$"          => s"\1ive",
    r"([^f])ves$"           => s"\1fe",
    r"[us]ses$"             => s"us",
    r"ises$"                => s"is",
    r"ses$"                 => s"sis",
    r"s$"                   => s"",
    r"mina$"                => s"men",
    r"([aegmosu])ata$"      => s"\1a",
    r"([ti])a$"             => s"\1um",
    r"a$"                   => s"on",
    r"geese$"               => s"goose",
    r"ae$"                  => s"a",
    r"i$"                   => s"us",
    r"im$"                  => s"",
    r"men$"                 => s"man",
    r"feet$"                => s"foot",
    r"([ae])ux$"            => s"\1u"
]

const IGNORE_SUFFIXES = [" General", "-in-law"]

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
    # handle cases like Attorneys General, children-in-law
    for suffix in IGNORE_SUFFIXES
        if endswith(s, suffix)
            return singularize(stem(s, length(suffix))) * suffix
        end
    end

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
        chopped = stem(s, 2)
        if chopped ∈ SINGLE_S
            return chopped
        end
    end

    # A18: -i to -o (cls)
    for w in A18
        if endswith(s, stem(w, 1, "i"))
            return stem(s, 1, "o")
        end
    end

    for (regex, subst) ∈ SINGULARIZE_RULES
        if contains(s, regex)
            return replace(s, regex => subst)
        end
    end
    s
end
singularize(s::AbstractString) = singularize(String(s))
