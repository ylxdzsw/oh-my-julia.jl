export car, cdr, cadr,
       nrow, ncol, void

@inline car(x::ANY)  = x[1]
@inline cdr(x::ANY)  = x[2:end]
@inline cadr(x::ANY) = x[2]

@inline nrow(x::ANY) = size(x,1)
@inline ncol(x::ANY) = size(x,2)

@inline void(x::ANY...) = nothing
