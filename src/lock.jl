export Lock, acquire, release

mutable struct Lock{T}
    avaliable::Bool
    condition::Condition
    data::T

    Lock(x::T) = new(true, Condition(), x)
end

Lock{T}(x::T) = Lock{T}(x)

function acquire(l::Lock)
    while !l.avaliable
        wait(l.condition)
    end
    l.avaliable = false
    l.data
end

function release(l::Lock)
    l.avaliable = true
    notify(l.condition, all=false)
end

function acquire(f, l::Lock)
    data = acquire(l)
    try
        f(data)
    finally
        release(l)
    end
end
