export nrow, ncol, rbind, cbind

nrow = x->size(x,1)
ncol = x->size(x,2)

const rbind = vcat
const cbind = hcat
