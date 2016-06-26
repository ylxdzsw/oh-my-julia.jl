import Base: map, map!, reduce, filter, filter!, take, get
export extract

map(f::Function) = x -> map(f,x)
map!(f::Function) = x -> map!(f,x)
reduce(f::Function) = x -> reduce(f,x)
filter(f::Function) = x -> filter(f,x)
filter!(f::Function) = x -> filter!(f,x)

take(n::Integer) = x -> take(x, n)
get(y) = x -> get(x, y)
get(y, z) = x -> get(x, y, z)

extract(y) = x -> x[y]
