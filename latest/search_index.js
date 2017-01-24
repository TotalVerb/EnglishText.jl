var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "English.jl Documentation",
    "title": "English.jl Documentation",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#English.jl-Documentation-1",
    "page": "English.jl Documentation",
    "title": "English.jl Documentation",
    "category": "section",
    "text": ""
},

{
    "location": "index.html#English.Articulate.indefinite",
    "page": "English.jl Documentation",
    "title": "English.Articulate.indefinite",
    "category": "Function",
    "text": "indefinite(word)\n\nDetermine the correct indefinite article, from “a” or “an”, for the given noun.\n\njulia> using English\n\njulia> indefinite(\"hour\")\n\"an\"\n\njulia> indefinite(\"hand\")\n\"a\"\n\n\n\n"
},

{
    "location": "index.html#Indefinite-Article-Selection-1",
    "page": "English.jl Documentation",
    "title": "Indefinite Article Selection",
    "category": "section",
    "text": "indefinite"
},

{
    "location": "index.html#English.Numeric.english",
    "page": "English.jl Documentation",
    "title": "English.Numeric.english",
    "category": "Function",
    "text": "Convert n to English, given that 0 le n  10^66.\n\njulia> using English\n\njulia> english(16)\n\"sixteen\"\n\n\n\n"
},

{
    "location": "index.html#English.Numeric.unenglish",
    "page": "English.jl Documentation",
    "title": "English.Numeric.unenglish",
    "category": "Function",
    "text": "unenglish(T <: Integer, data::AbstractString) → T\n\nConvert data to an integral type. This function has the guarantee that unenglish(Int, english(x)) == x, modulo any type differences. It is not guaranteed to work well or throw exceptions on other inputs.\n\njulia> using English\n\njulia> unenglish(Int, \"sixteen\")\n16\n\n\n\n"
},

{
    "location": "index.html#Word-Representation-of-Numbers-1",
    "page": "English.jl Documentation",
    "title": "Word Representation of Numbers",
    "category": "section",
    "text": "english\nunenglish"
},

{
    "location": "index.html#English.Quantities.ItemQuantity",
    "page": "English.jl Documentation",
    "title": "English.Quantities.ItemQuantity",
    "category": "Type",
    "text": "ItemQuantity(n::Integer, item::AbstractString)\n\nRepresents a quantity of n occurrences of item.\n\njulia> using English\n\njulia> ItemQuantity(2, \"apple\")\n2 apples\n\njulia> ItemQuantity(1, \"standard canine\")\n1 standard canine\n\n\n\n"
},

{
    "location": "index.html#English.Pluralize.pluralize",
    "page": "English.jl Documentation",
    "title": "English.Pluralize.pluralize",
    "category": "Function",
    "text": "pluralize(word; classical=true)\n\nPluralize a word (given in canonical capitalization) using heuristics and lists of exceptions.\n\njulia> using English\n\njulia> pluralize(\"fox\")\n\"foxes\"\n\n\n\n"
},

{
    "location": "index.html#Quantities-and-Pluralization-1",
    "page": "English.jl Documentation",
    "title": "Quantities and Pluralization",
    "category": "section",
    "text": "ItemQuantity\npluralize"
},

{
    "location": "index.html#English.ItemLists.ItemList",
    "page": "English.jl Documentation",
    "title": "English.ItemLists.ItemList",
    "category": "Constant",
    "text": "ItemList(objects, connective=Sum())\n\nA list of items or adjectives, which supports printing in standard English format.\n\njulia> using English\n\njulia> ItemList([\"apples\", \"oranges\"])\napples and oranges\n\njulia> ItemList([\"animal\", \"plant\"], Disjunction())\nanimal or plant\n\njulia> ItemList([\"red\", \"blue\", \"white\"], Conjunction())\nred, blue, and white\n\n\n\n"
},

{
    "location": "index.html#Lists-of-Nouns-and-Adjectives-1",
    "page": "English.jl Documentation",
    "title": "Lists of Nouns and Adjectives",
    "category": "section",
    "text": "ItemList"
},

{
    "location": "index.html#English.Text.sentences",
    "page": "English.jl Documentation",
    "title": "English.Text.sentences",
    "category": "Function",
    "text": "sentences(text::AbstractString)\n\nReturn an iterable over the Sentences contained within text. Sentences are identified naïvely; that is, every full stop, exclamation mark, or question mark is considered to delimit a sentence. This is of course prone to error, as some full stops are used for abbreviations and not for delimiting sentences.\n\njulia> using English\n\njulia> for s in sentences(\"Hi! Iterate over sentences. OK?\")\n           println(s)\n       end\nHi!\nIterate over sentences.\nOK?\n\n\n\n"
},

{
    "location": "index.html#Parsing-Sentences-1",
    "page": "English.jl Documentation",
    "title": "Parsing Sentences",
    "category": "section",
    "text": "sentences"
},

]}
