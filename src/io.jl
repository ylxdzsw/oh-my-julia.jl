import Base: <<, >>

<<(x::IO, y) = (write(x, y); x)
<<(x::IO, f::Function) = f(x)
>>(x::IO, y) = read(x, y)
