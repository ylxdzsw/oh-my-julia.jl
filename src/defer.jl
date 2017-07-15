export @defer, @force

import Base.fetch

struct Thunk
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
    while thunk isa Thunk
        thunk = thunk()
    end
    thunk
end
