export @~, @f_str

function curring_call_trans(acc, rest)
    isempty(rest) && return acc

    h = car(rest)

    if isa(h, Symbol)
        h = Expr(:call, h, acc)
    elseif h.head == :call
        if isa(h.args[1], Expr) && h.args[1].head == :quote
            n = h.args[1].args[1]
            h.args[1] = acc
            unshift!(h.args, n)
        else
            push!(h.args, acc)
        end
    else
        throw(ArgumentError("unexpected $h"))
    end

    curring_call_trans(h, cdr(rest))
end

macro ~(name, call...)
    esc(curring_call_trans(name, call))
end

macro f_str(ind)
    ex = parse("x[$ind]")
    ex.args[2] = esc(ex.args[2])

    :( x -> $(ex) )
end
