import Base: map, map!, min, max, conv
export Δ, groupby, level_to_edge

map(f::Base.Callable, g::Base.Callable, x) = map(f, map(g, x))
map!(f::Base.Callable, g::Base.Callable, x) = map!(f, map(g, x))

Δ{T}(x::Vector{T}) = Tuple{T,T}[(x[i+1],x[i]) for i in 1:length(x)-1]
Δ(f::Function, x::Vector) = [f(x[i+1],x[i]) for i in 1:length(x)-1]
Δ{T}(f::Function, ::Type{T}, x::Vector) = T[f(x[i+1],x[i]) for i in 1:length(x)-1]

function min(x...; by=identity, lt=<)
    length(x) == 0 ? throw(ArgumentError("min() needs at least one argument")) :
    length(x) == 1 ? car(x) :
    reduce(x) do a,b
        lt(by(a), by(b)) ? a : b
    end
end

function max(x...; by=identity, lt=<)
    length(x) == 0 ? throw(ArgumentError("max() needs at least one argument")) :
    length(x) == 1 ? car(x) :
    reduce(x) do a,b
        lt(by(a), by(b)) ? b : a
    end
end

function groupby(f, op, v0, itr)
    @assert isimmutable(v0) "v0 is mutable, use lambda instead"

    result = Dict()

    for i in itr
        key = f(i)
        result[key] = op(get(result, key, v0), i)
    end

    result
end

function groupby(f, op, v0::Function, itr)
    result = Dict()

    for i in itr
        key = f(i)
        if key in keys(result)
            result[key] = op(result[key], i)
        else
            result[key] = op(v0(), i)
        end
    end

    result
end

function groupby(f, op, itr)
    result = Dict()

    for i in itr
        key = f(i)
        if key in keys(result)
            result[key] = op(result[key], i)
        else
            result[key] = i
        end
    end

    result
end

function level_to_edge(arr)
    result = Tuple{Int, eltype(arr)}[]
    isempty(arr) && return result
    state = arr[1]
    push!(result, (1, state))

    for (i, v) in enumerate(arr)
        if state != v
            state = v
            push!(result, (i, v))
        end
    end

    result
end

function conv(f::Function, A::Vector; kernel::Int=2, stride::Int=1, ret_t::Type=Any)
    A′ = Vector{ret_t}((length(A)-kernel)÷stride+1)
    for i in eachindex(A′)
        offset = (i - 1) * stride
        A′[i]  = f(A[offset+1:offset+kernel]...)
    end
    A′
end
