export to_module

function to_module(d::Associative)
    m = Module(:__anon__, false)
    exprs = (Expr(:const, Expr(:(=), Symbol(k), v)) for (k,v) in d)
    eval(m, Expr(:toplevel, exprs...))
    m
end

export counter

const counter = ((c) -> () -> c += 1)(0)

export @rel_str

macro rel_str(x) isinteractive() ? x : joinpath(Base.source_dir(), split(x, '/')...) end

export all_files

all_files(dir) = map(x->"$dir/$x", readdir(dir))

export ∅

import Base.==

"The empty set, x == ∅ calls isempty(x)"
struct ∅ₜ end

const ∅ = ∅ₜ()

==(x::Any, ::∅ₜ) = isempty(x)
==(::∅ₜ, x::Any) = isempty(x)
