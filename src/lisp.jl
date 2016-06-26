export car, cdr, cadr

car(x::Tuple) = x[1]
cdr(x::Tuple) = x[2:end]
cadr(x::Tuple) = x[2]
