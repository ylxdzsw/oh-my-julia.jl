import Base: map, map!
export Δ

map(f::Function, g::Function, x) = map(f∘g, x)
map!(f::Function, g::Function, x) = map!(f∘g, x)

Δ{T}(x::Vector{T}) = Tuple{T,T}[(x[i+1],x[i]) for i in 1:length(x)-1]
Δ(f::Function, x::Vector) = [f(x[i+1],x[i]) for i in 1:length(x)-1]
Δ{T}(f::Function, ::Type{T}, x::Vector) = T[f(x[i+1],x[i]) for i in 1:length(x)-1]
