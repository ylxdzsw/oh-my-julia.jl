export ++

import Base.*

++(a, b) = [a; b]

@eval $(:(=)) = ==
@eval export $(:(=))

*{T<:Integer}(x::Integer, t::Type{T}) = t(x)
