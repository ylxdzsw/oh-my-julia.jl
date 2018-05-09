export car, cdr, cadr, cons,
       nrow, ncol, void

@inline car(x::ANY)   = x[1]
@inline cdr(x::ANY)   = x[2:end]
@inline cdr(x::Tuple) = Base.tail(x)
@inline cadr(x::ANY)  = x[2]

@inline cons(x::Tuple, y::ANY) = (x..., y)
@inline cons(x::ANY, y::Tuple) = (x, y...)
@inline cons(x::Tuple, y::Tuple) = (x..., y...)
@inline cons(x::ANY, y::ANY) = (x, y)

@inline nrow(x::ANY) = size(x,1)
@inline ncol(x::ANY) = size(x,2)

@inline void(x::ANY...) = nothing
