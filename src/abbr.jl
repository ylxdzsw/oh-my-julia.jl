export ∞, Bytes, Byte, rbind, cbind

const ∞ = Inf

typealias Bytes Vector{UInt8}
typealias Byte UInt8
typealias AbstractBytes AbstractArray{Byte, 1}

const rbind = vcat
const cbind = hcat
