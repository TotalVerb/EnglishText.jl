#=――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    NOTE
    The algorithm here lists items in the standard way, using commas, spaces,
    and the word "and". There is currently no option to remove the Oxford comma.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――=#

@reexport module ItemLists

export ItemList

immutable ItemList
    objs
end

function Base.show(io::IO, list::ItemList)
    objs = collect(list.objs)
    if length(objs) == 0
        print(io, "no objects")
    elseif length(objs) == 1
        print(io, objs[1])
    elseif length(objs) == 2
        print(io, objs[1], " and ", objs[2])
    elseif length(objs) ≥ 3
        for obj in @view objs[1:end-1]
            print(io, obj, ", ")
        end
        print(io, "and ", objs[end])
    end
end

end
