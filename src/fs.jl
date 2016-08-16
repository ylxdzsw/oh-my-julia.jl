export @__DIR__, @rel_str, @require

macro __DIR__() Base.source_dir() end
macro rel_str(x) joinpath(Base.source_dir(), split(x, '/')...) end
