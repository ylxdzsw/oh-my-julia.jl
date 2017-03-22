export ∘, ++

import Base.*

∘(f, g) = x->f(g(x))

++(a, b) = [a; b]

@eval $(:(=)) = ==
@eval export $(:(=))

*{T<:Integer}(x::Integer, t::Type{T}) = t(x)
