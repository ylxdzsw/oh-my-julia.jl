export car, cdr, cadr,
       nrow, ncol, void

car(x::Tuple) = x[1]
cdr(x::Tuple) = x[2:end]
cadr(x::Tuple) = x[2]

nrow = x->size(x,1)
ncol = x->size(x,2)

void(x::ANY...) = nothing
