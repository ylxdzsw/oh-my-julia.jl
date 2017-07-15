export @i_str, @when

macro i_str(ind)
    ex = parse("x[$ind]")
    ex.args[2] = esc(ex.args[2])
    Expr(:->, :x, ex)
end

macro when(exp)
    :( !$(esc(exp)) && continue )
end
