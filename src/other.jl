export to_module

function to_module(d::Dict)
    m = Module(:__anon__, false)
    exprs = (Expr(:const, Expr(:(=), Symbol(k), v)) for (k,v) in d)
    eval(m, Expr(:toplevel, exprs...))
    m
end
