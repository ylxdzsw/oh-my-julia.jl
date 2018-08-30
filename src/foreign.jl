export car, cdr, cadr, cons,
       nrow, ncol, void

@nospecialize

@inline car(x) = x[1]
@inline cdr(x) = x[2:end]
@inline cdr(x::Tuple) = Base.tail(x)
@inline cadr(x) = x[2]

@inline cons(x::Tuple, y) = (x..., y)
@inline cons(x, y::Tuple) = (x, y...)
@inline cons(x::Tuple, y::Tuple) = (x..., y...)
@inline cons(x, y) = (x, y)

@inline nrow(x) = size(x,1)
@inline ncol(x) = size(x,2)

@inline void(x...) = nothing

@specialize
