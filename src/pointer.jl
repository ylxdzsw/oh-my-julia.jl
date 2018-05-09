import Base: getindex, setindex!

getindex(p::Ptr, i::Integer=1) = unsafe_load(p, i)
setindex!(p::Ptr, x, i::Integer=1) = unsafe_store!(p, x, i)

import Base: *

*(::Type{T}) where T = Ptr{T}
