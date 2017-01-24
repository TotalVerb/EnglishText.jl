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

]}
