import Base: getindex, setindex!

export Lock, waitfor

"A locked data that can be `waitfor` by other tasks"
mutable struct Lock{T}
    condition::Condition
    data::T
end

Lock(x::T) where T = Lock{T}(Condition(), x)

waitfor(f, l::Lock) = while !f(l.data)
    wait(l.condition)
end

getindex(l::Lock, args...) = l.data

function setindex!(l::Lock, v, opt::Symbol=:secret)
    l.data = v
    opt == :secret ? nothing :
    opt == :all ? notify(l.condition) :
    opt == :one ? notify(l.condition, all=false) :
    ArgumentError("unknown option $opt")
end
