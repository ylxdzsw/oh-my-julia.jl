import Base: <<, >>, >>>

export asbytes

struct asbytes{T}
    data::T
end

<<(x::IO, y) = (print(x, y); x)
<<(x::IO, y::Bytes) = (write(x, y); x)
<<(x::IO, y::asbytes) = (write(x, y); x)
<<(x::IO, f::Function) = (f(x); x)

>>(x::IO, y) = read(x, y)
>>(x::IO, f::Function) = f(x)

>>>(x::IO, y) = (read(x, y); x)
>>>(x::IO, f::Function) = (f(x); x)

export prt

prt(xs...) = prt(STDOUT, xs...)
prt(io::IO, xs...) = begin
    lock(io)
    try
        print(io, car(xs))
        for x in cdr(xs)
            print(io, '\t')
            print(io, x)
        end
        print(io, '\n')
    finally
        unlock(io)
    end
end

import Base.eachline

eachline(f::Function, x) = (f(x) for x in eachline(x))

<<(x::typeof(log), y) = println(STDERR, "LOG: ", Dates.format(now(), "HH:MM:SS "), y)
<<(x::typeof(info), y) = info(Dates.format(now(), "HH:MM:SS "), y)
<<(x::typeof(warn), y) = warn(Dates.format(now(), "HH:MM:SS "), y)
