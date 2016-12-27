export @defer, @force

import Base.fetch

type Thunk
    f::Function
end

(thunk::Thunk)() = thunk.f()

macro defer(ex)
    :(Thunk(() -> $ex))
end

macro force(ex)
    :(fetch($ex))
end

function fetch(thunk::Thunk)
    while isa(thunk, Thunk)
        thunk = thunk()
    end
    thunk
end
