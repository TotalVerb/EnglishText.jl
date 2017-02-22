# EnglishText.jl Documentation

Many applications display information to readers in prose format instead of
tabular format. It is often important to generate human-readable, grammatically
correct prose. However, taking care of grammatical special cases is tedious.

EnglishText.jl solves this problem by providing a variety of convenient utility
functions. It uses established algorithms where available. The precise methods
used are documented in the modules themselves.

EnglishText.jl uses a modular approach. Applications not requiring all the
exports may use a submodule, such as `EnglishText.ItemLists`, instead of the
entire package.

EnglishText.jl aims to

 - provide a convenient, universally useful approach to abstracting away
   grammatical special cases
 - be self-documenting where possible, but well-documented nevertheless
 - not have unnecessary performance bottlenecks

Note that this is not a natural language processing package and does not aim to
include an English parser.

```@contents
```

## Indefinite Article Selection

```@docs
indefinite
```

## Word Representation of Numbers

```@docs
english
unenglish
```

## Quantities and Pluralization

```@docs
ItemQuantity
pluralize
singularize
```

## Lists of Nouns and Adjectives

```@docs
ItemList
```

## Parsing Sentences

```@docs
sentences
```

## Citations

- Conway, D. M. (1998, August). An algorithmic approach to english
  pluralization. In Proceedings of the Second Annual Perl Conference.
