import Base: <<, >>, >>>

<<(x::IO, y::Int) = (print(x, y); x) # can be removed if Base fixed
<<(x::IO, y::Integer) = (print(x, y); x) # can be removed if Base fixed
<<(x::IO, y) = (print(x, y); x)
<<(x::IO, y::Byte) = (write(x, y); x)
<<(x::IO, y::Bytes) = (write(x, y); x)
<<(x::IO, f::Function) = (f(x); x)

>>(x::IO, y::Int) = readbytes(x, y) # can be removed if Base fixed
>>(x::IO, y::Integer) = readbytes(x, y)
>>(x::IO, y) = read(x, y)
>>(x::IO, f::Function) = f(x)

>>>(x::IO, y::Int) = (readbytes(x, y); x) # can be removed if Base fixed
>>>(x::IO, y::Integer) = (readbytes(x, y); x)
>>>(x::IO, y) = (read(x, y); x)
>>>(x::IO, f::Function) = (f(x); x)
