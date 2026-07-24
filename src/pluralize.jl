#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm used for inflecting English words into plurals is described by
    Damian Conway of Monash University. The original paper is accessible at
    <http://www.csse.monash.edu.au/~damian/papers/HTML/Plurals.html>

    Several of the tables described within are obtained from
    <http://www.csse.monash.edu.au/~damian/papers/HTML/Plurals_AppendixA.html>

    CITATION
    Conway, D. M. (1998, August). An algorithmic approach to english
    pluralization. In Proceedings of the Second Annual Perl Conference.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

module Pluralize

export pluralize

const SUFFIX_NOINFLECT = [
    r"fish$", r"ois$", r"deer$", r"pox$", r"[A-Z].*ese$", r"itis$"]


# table A.1, anglicized
const IRREGULAR_ANG = Dict(
    "beef" => "beefs",
    "brother" => "brothers",
    "child" => "children",
    "cow" => "cows",
    "die" => "dice",
    "ephemeris" => "ephemerides",
    "genie" => "genies",
    "graffito" => "graffiti",
    "money" => "moneys",
    "mongoose" => "mongooses",
    "mythos" => "mythoi",
    "octopus" => "octopuses",
    "ox" => "oxen",
    "soliloquy" => "soliloquies",
    "trilby" => "trilbys")

# table A.1, classical
const IRREGULAR_CLS = merge(IRREGULAR_ANG, Dict(
    "beef" => "beeves",
    "brother" => "brethren",
    "cow" => "kine",
    "die" => "dice",
    "money" => "monies",
    "octopus" => "octopodes"))

# table A.2
const WORD_NOINFLECT = Set([
    "bison", "flounder", "pliers", "bream", "gallows", "proceedings",
    "breeches", "graffiti", "rabies", "britches", "headquarters", "salmon",
    "carp", "herpes", "scissors", "chassis", "high-jinks", "sea-bass",
    "clippers", "homework", "series", "cod", "innings", "shears", "contretemps",
    "jackanapes", "species", "corps", "mackerel", "swine", "debris", "measles",
    "moose", "trout", "diabetes", "mews", "tuna", "djinn", "mumps", "whiting",
    "eland", "news", "wildebeest", "elk", "pincers"])

# table A.3 — currently used only for unpluralization
const SINGLE_S = Set([
    "polis", "asbestos", "glottis", "rhinoceros", "canvas", "lens", "chaos",
    "ibis", "marquis", "caddis", "epidermis", "cannabis", "cosmos", "pathos",
    "dais", "bias", "aegis", "digitalis", "gas", "atlas", "ethos", "pelvis",
    "alias", "trellis", "metropolis", "mantis", "bathos", "acropolis",
    "sassafras"])

# table A.5, anglicized
const PRONOUNS_ANG = Dict(
    "I" => "we",
    "me" => "us",
    "myself" => "ourselves",
    "you" => "you",
    "thou" => "you",
    "thee" => "you",
    "yourself" => "yourself",
    "thyself" => "yourself",
    "she" => "they",
    "he" => "they",
    "it" => "they",
    "they" => "they",
    "her" => "them",
    "him" => "them",
# unfortunately we have no way of telling this from the it above
#    "it" => "them",
    "them" => "them",
    "herself" => "themselves",
    "himself" => "themselves",
    "itself" => "themselves",
    "themself" => "themselves",
    "oneself" => "oneselves")

const PRONOUNS_CLS = let
    temp = copy(PRONOUNS_ANG)
    temp["thou"] = temp["thee"] = "ye"
    temp
end

# table A.10 -a to -ae
const A10 = ("alumna", "alga", "vertebra")

# table A.11 -a to -ae classical
const A11 = Set([
    "abscissa", "formula", "medusa", "amoeba", "hydra", "nebula", "antenna",
    "hyperbola", "nova", "aurora", "lacuna", "parabola"])

# table A.12 -a to -as or -ata
const A12 = Set([
    "charisma", "drama", "carcinoma", "trauma", "schema", "oedema", "enema",
    "dogma", "edema", "sarcoma", "bema", "enigma", "magma", "anathema", "gumma",
    "soma", "miasma", "lymphoma", "melisma", "lemma", "diploma", "stoma",
    "stigma"])

# table A.13 -en to -ens | -ena
const A13 = ("stamen", "foramen", "lumen")

# table A.14 -ex to -ices
const A14 = ("codex", "murex", "silex")

# table A.15 -ex to -exes (ang.) or -ices (cls.)
const A15 = Set([
    "apex", "latex", "vertex", "cortex", "pontifex", "vortex", "index",
    "simplex"])

# table A.16 -is to -ises (ang.) or -ides (cls.)
const A16 = ("iris", "clitoris")

# table A.17 -o to -os
const A17 = Set([
    "albino", "generalissimo", "manifesto", "archipelago", "ghetto", "medico",
    "armadillo", "guano", "octavo", "commando", "inferno", "photo", "ditto",
    "jumbo", "pro", "dynamo", "lingo", "quarto", "embryo", "lumbago", "rhino",
    "fiasco", "magneto", "stylo", "macro"])

# table A.18 -o to -os (ang.) or -i (cls)
const A18 = Set([
    "alto", "contralto", "soprano", "basso", "crescendo", "tempo", "canto",
    "solo"])

# table A.19 -on to -a
const A19 = Set([
    "aphelion", "hyperbaton", "perihelion", "asyndeton", "noumenon",
    "phenomenon", "criterion", "organon", "prolegomenon"])

# table A.20 -um to -a
const A20 = Set([
    "agendum", "datum", "extremum", "bacterium", "desideratum", "stratum",
    "candelabrum", "erratum", "ovum"])

# table A.21 -um to -ums | -a
const A21 = Set([
    "aquarium", "interregnum", "quantum", "compendium", "lustrum", "rostrum",
    "consortium", "maximum", "spectrum", "cranium", "medium", "speculum",
    "curriculum", "memorandum", "stadium", "dictum", "millenium", "trapezium",
    "emporium", "minimum", "ultimatum", "enconium", "momentum", "vacuum",
    "gymnasium", "optimum", "velum", "honorarium", "phylum"])

# table A.22 -us to -uses | -i
const A22 = Set([
    "cactus", "focus", "nimbus", "succubus", "fungus", "nucleolus", "torus",
    "genius", "radius", "umbilicus", "incubus", "stylus", "uterus"])

# table A.23 -us to -uses | -us
const A23 = Set([
    "apparatus", "impetus", "prospectus", "cantus", "nexus", "sinus", "coitus",
    "plexus", "status", "hiatus"])

# in the paper cited, A.24. is used for ifrit to ifriti
# a Google ngrams search reveals no use of ifriti therefore we decide to omit
# A.24 even in classical mode

# table A.25 - to -im
const A25 = ("cherub", "goy", "seraph")

# table A.26 -general to -general
const A26 = ("Adjutant", "Lieutenant", "Quartermaster", "Brigadier", "Major")

const SUFFIX_IRREGULAR = Dict(
    r"man$" => (3, "men"),
    r"[lm]ouse$" => (4, "ice"),
    r"tooth$" => (5, "teeth"),
    r"goose$" => (5, "geese"),
    r"foot$" => (4, "feet"),
    r"zoon$" => (4, "zoa"),
    r"[csx]is$" => (2, "es"))

const SUFFIX_CLASSICAL = Dict(
    r"trix$" => (4, "trices"),
    r"eau$" => (3, "eaux"),
    r"ieu$" => (3, "ieux"),
    r"..[iay]nx$" => (2, "nges"))

const SUFFIX_COMMON = Dict(
    r"[cs]h$" => (1, "hes"),
    r"[xs]$" => (0, "es"),
    r"iz$" => (2, "izzes"),
    r"[^i]z$" => (1, "zes"),
    r"[aeiou]y$" => (1, "ys"),
    r"[A-Z].*y$" => (1, "ys"),
    r"y$" => (1, "ies"),
    r"[aeo]lf$" => (1, "ves"),
    r"[^d]eaf$" => (1, "ves"),
    r"arf$" => (1, "ves"),
    r"[nlw]ife" => (2, "ves"))

function fromend(word, suffixlen)
    offset = length(word) - suffixlen
    offset == 0 ? 0 : nextind(word, 0, offset)
end

stem(word, suffixlen) = word[1:fromend(word, suffixlen)]
stem(word, suffixlen, rest) = stem(word, suffixlen) * rest

function suffix_inflect(table, word)
    for (sfx, (offset, newsfx)) in table
        if occursin(sfx, word)
            return stem(word, offset, newsfx)
        end
    end
    nothing
end

function isnoninflecting(word, classical)
    wordmatches(re) = occursin(re, word)
    any(wordmatches, SUFFIX_NOINFLECT) ||
        word ∈ WORD_NOINFLECT ||
        classical && word ∈ A23
end

"""
    pluralize(word; classical=true)

Pluralize a singular noun `word` (given in canonical capitalization) using
heuristics and lists of exceptions. If `word` is not a singular noun, this
function may give strange results.

If `classical` is set to `true`, then the classical (i.e. inherited from Latin
or Greek) pluralization is chosen instead of the anglicized pluralization. As
an example, the classical plural of `"vertex"` is `"vertices"`, but the
anglicized plural is `"vertexes"`. By default, the classical pluralization is
used.

```jldoctest
julia> using EnglishText

julia> pluralize("fox")
"foxes"

julia> pluralize("radius")
"radii"

julia> pluralize("radius", classical=false)
"radiuses"
```
"""
function pluralize(word::String; classical=true)
    words = split(word)
    if isempty(words)
        throw(ArgumentError("Cannot pluralize the empty string."))
    elseif length(words) == 1
        @assert !isempty(words[1])
        pluralize_single_word(words[1], classical)
    else
        lastword = words[end]
        @assert !isempty(lastword)
        firstwords = join(words[1:end-1], " ")
        if lastword == "General" && !(firstwords ∈ A26)
            string(pluralize(firstwords), " ", lastword)
        else
            string(firstwords, " ", pluralize_single_word(lastword, classical))
        end
    end
end
pluralize(word; classical=true) = pluralize(String(word); classical=classical)

pluralize_single_word(word, classical::Bool) =
    pluralize_single_word(String(word), classical)
function pluralize_single_word(word::String, classical::Bool)::String
    if isnoninflecting(word, classical)
        # words that do not inflect
        return word
    elseif haskey(PRONOUNS_CLS, word)
        # pronouns; note that preposition pronoun not handled currently
        return (classical ? PRONOUNS_CLS : PRONOUNS_ANG)[word]
    elseif haskey(IRREGULAR_CLS, word)
        # irregular plurals
        return (classical ? IRREGULAR_CLS : IRREGULAR_ANG)[word]
    end

    # irregular suffix
    irr = suffix_inflect(SUFFIX_IRREGULAR, word)
    if irr !== nothing
        return coalesce(irr)
    end

    # -in-law
    if endswith(word, "-in-law")
        return string(pluralize_single_word(word[1:end-7], classical),
                      "-in-law")
    end

    # classical inflections, retained
    if word ∈ A14 || classical && word ∈ A15
        return stem(word, 2, "ices")
    elseif word ∈ A20 || classical && word ∈ A21
        return stem(word, 2, "a")
    elseif word ∈ A19
        return stem(word, 2, "a")
    elseif word ∈ A10 || classical && word ∈ A11
        return stem(word, 1, "ae")
    end

    # classical inflections, anglicized
    if classical
        cls = suffix_inflect(SUFFIX_CLASSICAL, word)
        if cls !== nothing
            return coalesce(cls)
        end

        if word ∈ A13
            return stem(word, 2, "ina")
        elseif word ∈ A12
            return stem(word, 1, "ata")
        elseif word ∈ A16
            return stem(word, 2, "ides")
        elseif word ∈ A22
            return stem(word, 2, "i")
        elseif word ∈ A18  # nb: A23 handled as non-inflecting
            return stem(word, 1, "i")
        elseif word ∈ A25
            return word * "im"
        end
    end

    # suffixes ending in -ss, -es, -f, -fe, -y, -ys
    com = suffix_inflect(SUFFIX_COMMON, word)
    if com !== nothing
        return coalesce(com)
    end

    # suffixes ending in -o
    if word ∈ A17 || word ∈ A18
        return word * "s"
    elseif occursin(r"[aeiou]o$", word)
        return word * "s"
    elseif occursin(r"o$", word)
        return word * "es"
    end

    # just add s
    word * "s"
end

include("singularize.jl")

end  # module Pluralize

import .Pluralize: pluralize, singularize
export pluralize, singularize
