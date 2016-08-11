export @__DIR__, @rel_str, @require

macro __DIR__() Base.source_dir() end
macro rel_str(x) joinpath(Base.source_dir(), split(x, '/')...) end

macro require(p, opt...)
    pwd = isinteractive() ? Base.pwd() : Base.source_dir()
    p = joinpath(pwd, split(p, '/')...)

    code = quote
        ps = if isfile($p)
            [$p]
        elseif isdir($p)
            filter(isfile, map(x->joinpath($p,x), readdir($p)))
        else
            error($p * " not found")
        end

        for p in ps
            p = include(p)
            isa(p, Module) && $(esc(:eval))(Expr(:using, module_name(p)))
        end
    end

    if length(opt) == 2
        as, mod = opt

        if as != :as || !isa(mod, Symbol)
            error("syntax error: use @require \"xx\" [as xx]")
        end

        m = Module(mod)

        eval(m, code)

        code = quote
            $(esc(mod)) = $m
        end
    elseif length(opt) != 0
        error("syntax error: use @require \"xx\" [as xx]")
    end

    code
end
