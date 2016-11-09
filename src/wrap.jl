@reexport module WrapText

export wrap

"""
Retrieve the next word from the given text, assuming the current state `i` is
at a word character.
"""
nextword(s, i) =
    for c in rest(s, i)
        if !isspace(c)
            return c
        end
    end

"""
A lazy container for wrapped text. All whitespace in the source text is
collapsed and the text is rewrapped.

The `indents` iterator should be a stateless iterator; stateful iterators must
be `tee`d first, or they will not function correctly.
"""
immutable WrappedText{T,I} <: AbstractString
    text::T
    indents::I
    to::Int
end

immutable WrapState{S}
    state::S
    linelen::Int
end

Base.start(wt::WrappedText) = WrapState(start(wt.text), 0)
Base.next(wt::WrappedText, s::WrapState) =
    # get next word, check if it needs breaking, if so break.

_textof(wt::WrappedText) = wt.text
_textof(x) = x

wrap(x, to=79; indent=0) = WrappedText(_textof(x), repeated(indent), to)

end
