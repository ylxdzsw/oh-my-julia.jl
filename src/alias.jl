export ∞, AbstractBytes, Bytes, Byte, u8, u16, u32, u64, u128, i32, i64, f32, f64

const ∞ = Inf

const AbstractBytes = Union{AbstractVector{UInt8}, Ptr{UInt8}}
const Bytes = Vector{UInt8}
const Byte  = UInt8

const u8  = UInt8
const u16 = UInt16
const u32 = UInt32
const u64 = UInt64
const u128 = UInt128
const i32 = Int32
const i64 = Int64
const f32 = Float32
const f64 = Float64

const Primitives = Union{
    UInt8, UInt16, UInt32, UInt64, UInt128,
    Int8, Int16, Int32, Int64, Int128,
    Float16, Float32, Float64
}
