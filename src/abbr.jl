export ∞, AbstractBytes, Bytes, Byte, u8, u16, u32, u64, i32, i64, f32, f64

const ∞ = Inf

typealias AbstractBytes Union{AbstractVector{UInt8}, Ptr{UInt8}}
typealias Bytes Vector{UInt8}
typealias Byte UInt8

typealias u8  UInt8
typealias u16 UInt16
typealias u32 UInt32
typealias u64 UInt64
typealias i32 Int32
typealias i64 Int64
typealias f32 Float32
typealias f64 Float64

typealias _u8  UInt8
typealias _u16 UInt16
typealias _u32 UInt32
typealias _u64 UInt64
typealias _i32 Int32
typealias _i64 Int64
typealias _f32 Float32
typealias _f64 Float64
