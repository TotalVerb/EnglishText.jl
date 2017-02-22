var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.jl Documentation",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#EnglishText.jl-Documentation-1",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.jl Documentation",
    "category": "section",
    "text": ""
},

{
    "location": "index.html#EnglishText.Articulate.indefinite",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Articulate.indefinite",
    "category": "Function",
    "text": "indefinite(word)\n\nDetermine the correct indefinite article, from “a” or “an”, for the given noun.\n\njulia> using EnglishText\n\njulia> indefinite(\"hour\")\n\"an\"\n\njulia> indefinite(\"hand\")\n\"a\"\n\n\n\n"
},

{
    "location": "index.html#Indefinite-Article-Selection-1",
    "page": "EnglishText.jl Documentation",
    "title": "Indefinite Article Selection",
    "category": "section",
    "text": "indefinite"
},

{
    "location": "index.html#EnglishText.Numeric.english",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Numeric.english",
    "category": "Function",
    "text": "Convert n to English, given that 0 le n  10^66.\n\njulia> using EnglishText\n\njulia> english(16)\n\"sixteen\"\n\n\n\n"
},

{
    "location": "index.html#EnglishText.Numeric.unenglish",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Numeric.unenglish",
    "category": "Function",
    "text": "unenglish(T <: Integer, data::AbstractString) → T\n\nConvert data to an integral type. This function has the guarantee that unenglish(Int, english(x)) == x, modulo any type differences. It is not guaranteed to work well or throw exceptions on other inputs.\n\njulia> using EnglishText\n\njulia> unenglish(Int, \"sixteen\")\n16\n\n\n\n"
},

{
    "location": "index.html#Word-Representation-of-Numbers-1",
    "page": "EnglishText.jl Documentation",
    "title": "Word Representation of Numbers",
    "category": "section",
    "text": "english\nunenglish"
},

{
    "location": "index.html#EnglishText.Quantities.ItemQuantity",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Quantities.ItemQuantity",
    "category": "Type",
    "text": "ItemQuantity(n::Integer, item::AbstractString)\n\nRepresents a quantity of n occurrences of item.\n\njulia> using EnglishText\n\njulia> ItemQuantity(2, \"apple\")\n2 apples\n\njulia> ItemQuantity(1, \"standard canine\")\n1 standard canine\n\n\n\n"
},

{
    "location": "index.html#EnglishText.Pluralize.pluralize",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Pluralize.pluralize",
    "category": "Function",
    "text": "pluralize(word; classical=true)\n\nPluralize a word (given in canonical capitalization) using heuristics and lists of exceptions.\n\njulia> using EnglishText\n\njulia> pluralize(\"fox\")\n\"foxes\"\n\n\n\n"
},

{
    "location": "index.html#EnglishText.Pluralize.singularize",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Pluralize.singularize",
    "category": "Function",
    "text": "singularize(word)\n\nUnpluralize a plural noun (given in canonical capitalization) using heuristics and lists of exceptions.\n\njulia> using EnglishText\n\njulia> singularize(\"foxes\")\n\"fox\"\n\njulia> singularize(\"data\")\n\"datum\"\n\n\n\n"
},

{
    "location": "index.html#Quantities-and-Pluralization-1",
    "page": "EnglishText.jl Documentation",
    "title": "Quantities and Pluralization",
    "category": "section",
    "text": "ItemQuantity\npluralize\nsingularize"
},

{
    "location": "index.html#EnglishText.ItemLists.ItemList",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.ItemLists.ItemList",
    "category": "Constant",
    "text": "ItemList(objects, connective=Sum())\n\nA list of items or adjectives, which supports printing in standard English format.\n\njulia> using EnglishText\n\njulia> ItemList([\"apples\", \"oranges\"])\napples and oranges\n\njulia> ItemList([\"animal\", \"plant\"], Disjunction())\nanimal or plant\n\njulia> ItemList([\"red\", \"blue\", \"white\"], Conjunction())\nred, blue, and white\n\n\n\n"
},

{
    "location": "index.html#Lists-of-Nouns-and-Adjectives-1",
    "page": "EnglishText.jl Documentation",
    "title": "Lists of Nouns and Adjectives",
    "category": "section",
    "text": "ItemList"
},

{
    "location": "index.html#EnglishText.Text.sentences",
    "page": "EnglishText.jl Documentation",
    "title": "EnglishText.Text.sentences",
    "category": "Function",
    "text": "sentences(text::AbstractString)\n\nReturn an iterable over the Sentences contained within text. Sentences are identified naïvely; that is, every full stop, exclamation mark, or question mark is considered to delimit a sentence. This is of course prone to error, as some full stops are used for abbreviations and not for delimiting sentences.\n\njulia> using EnglishText\n\njulia> for s in sentences(\"Hi! Iterate over sentences. OK?\")\n           println(s)\n       end\nHi!\nIterate over sentences.\nOK?\n\n\n\n"
},

{
    "location": "index.html#Parsing-Sentences-1",
    "page": "EnglishText.jl Documentation",
    "title": "Parsing Sentences",
    "category": "section",
    "text": "sentences"
},

{
    "location": "index.html#Citations-1",
    "page": "EnglishText.jl Documentation",
    "title": "Citations",
    "category": "section",
    "text": "Conway, D. M. (1998, August). An algorithmic approach to english pluralization. In Proceedings of the Second Annual Perl Conference."
},

]}
