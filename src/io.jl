import Base: <<, >>

<<(x::IO, y::Int) = (write(x, y); x) # can be removed if Base fixed
<<(x::IO, y::Integer) = (write(x, y); x) # can be removed if Base fixed
<<(x::IO, y) = (write(x, y); x)
<<(x::IO, f::Function) = f(x)

>>(x::IO, y::Int) = read(x, y) # can be removed if Base fixed
>>(x::IO, y::Integer) = read(x, y) # can be removed if Base fixed
>>(x::IO, y) = read(x, y)
