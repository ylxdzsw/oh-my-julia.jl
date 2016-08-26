import Base: <<, >>, >>>

<<(x::IO, y) = (print(x, y); x)
<<(x::IO, y::Byte) = (write(x, y); x)
<<(x::IO, y::Bytes) = (write(x, y); x)
<<(x::IO, f::Function) = (f(x); x)

>>(x::IO, y::Integer) = read(x, y)
>>(x::IO, y) = read(x, y)
>>(x::IO, f::Function) = f(x)

>>>(x::IO, y::Integer) = (read(x, y); x)
>>>(x::IO, y) = (read(x, y); x)
>>>(x::IO, f::Function) = (f(x); x)
