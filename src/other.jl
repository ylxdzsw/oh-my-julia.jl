export to_module, counter

function to_module(d::Associative)
    m = Module(:__anon__, false)
    exprs = (Expr(:const, Expr(:(=), Symbol(k), v)) for (k,v) in d)
    eval(m, Expr(:toplevel, exprs...))
    m
end

const counter = ((c) -> () -> println(c += 1))(0)
