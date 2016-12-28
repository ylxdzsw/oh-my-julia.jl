import Base: <<, >>, >>>

<<(x::IO, y) = (print(x, y); x)
<<(x::IO, y::Byte) = (write(x, y); x)
<<(x::IO, y::Bytes) = (write(x, y); x)
<<(x::IO, f::Function) = (f(x); x)

>>(x::IO, y) = read(x, y)
>>(x::IO, f::Function) = f(x)

>>>(x::IO, y) = (read(x, y); x)
>>>(x::IO, f::Function) = (f(x); x)

prt(xs...) = prt(STDOUT, xs)
prt(io::IO, xs...) = begin
    lock(io)
    try
        print(io, car(xs))
        for x in cdr(xs)
            print(io, '\t')
            print(Io, x)
        end
        print(io, '\n')
    finally
        unlock(io)
    end
end
