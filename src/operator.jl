export ++

import Base.*

++(a, b) = [a; b]

@eval $(:(=)) = ==
@eval export $(:(=))

*(x::Integer, ::Type{T}) where {T <: Primitives} = T(x)

import Base.ctranspose

ctranspose(x::Primitives) = ntoh(x)
