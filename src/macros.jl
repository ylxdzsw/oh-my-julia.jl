macro map(ex):((x) -> map(x->$ex,x))end
macro map!(ex):((x) -> map!(x->$ex,x))end
macro reduce(ex):((x) -> reduce(x->$ex,x))end
macro filter(ex):((x) -> filter(x->$ex,x))end
macro filter!(ex):((x) -> filter!(x->$ex,x))end

export @map, @map!, @reduce, @filter, @filter!