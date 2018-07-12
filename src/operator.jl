export ++

import Base: *, ×

++ = vcat

@eval $(:(=)) = ==
@eval export $(:(=))

*(x::Integer, ::Type{T}) where {T <: Primitives} = T(x)

*(x::Type...) = Tuple{x...}
×(x::Type...) = Tuple{x...}

import Base.ctranspose

# ctranspose(x::Primitives) = ntoh(x)

import Base.!

!(x::Nullable) = get(x)
