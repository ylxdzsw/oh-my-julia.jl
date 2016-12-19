export @~, @i_str, @with, @when

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
    elseif h.head == :macrocall
        h = Expr(:call, h, acc)
    else
        throw(ArgumentError("unexpected $h"))
    end

    curring_call_trans(h, cdr(rest))
end

macro ~(name, call...)
    esc(curring_call_trans(name, call))
end

macro i_str(ind)
    ex = parse("x[$ind]")
    ex.args[2] = esc(ex.args[2])
    Expr(:->, :x, ex)
end

"""
a = @with Dict{Int, Int}() do x
    x[2] = 3
end
"""
macro with(exp)
    a = shift!(exp.args)
    b = shift!(exp.args)
    unshift!(exp.args, a)

    quote
        let $(b.args[1].args[1]) = $exp
            $(b.args[2])
            $(b.args[1].args[1])
        end
    end
end

macro when(exp)
    :( !$(esc(exp)) && continue )
end
