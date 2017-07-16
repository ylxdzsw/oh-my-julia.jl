export to_module

function to_module(d::Associative)
    m = Module(:__anon__, false)
    exprs = (Expr(:const, Expr(:(=), Symbol(k), v)) for (k,v) in d)
    eval(m, Expr(:toplevel, exprs...))
    m
end

export counter

const counter = ((c) -> () -> println(c += 1))(0)

export @rel_str

macro rel_str(x) isinteractive() ? x : joinpath(Base.source_dir(), split(x, '/')...) end
