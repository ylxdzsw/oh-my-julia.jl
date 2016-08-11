import Base: map, map!, min, max
export Δ

map(f::Function, g::Function, x) = map(f∘g, x)
map!(f::Function, g::Function, x) = map!(f∘g, x)

Δ{T}(x::Vector{T}) = Tuple{T,T}[(x[i+1],x[i]) for i in 1:length(x)-1]
Δ(f::Function, x::Vector) = [f(x[i+1],x[i]) for i in 1:length(x)-1]
Δ{T}(f::Function, ::Type{T}, x::Vector) = T[f(x[i+1],x[i]) for i in 1:length(x)-1]

function min(x...; key=identity, lt=<)
    length(x) == 0 ? throw(ArgumentError("min() needs at least one argument")) :
    length(x) == 1 ? car(x) :
    reduce(x) do a,b
        lt(key(a), key(b)) ? a : b
    end
end

function max(x...; key=identity, lt=<)
    length(x) == 0 ? throw(ArgumentError("max() needs at least one argument")) :
    length(x) == 1 ? car(x) :
    reduce(x) do a,b
        lt(key(a), key(b)) ? b : a
    end
end
