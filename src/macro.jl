export @i_str, @when

macro i_str(ind)
    ex = parse("x[$ind]")
    ex.args[2] = esc(ex.args[2])
    Expr(:->, :x, ex)
end

macro when(exp)
    :( !$(esc(exp)) && continue )
end

macro retry(times, exp)
    quote
        let i = 0
            @label retry
            try
                $exp
            catch
                i >= $times && rethrow()

                i += 1
                yield()
                @goto retry
            end
        end
    end
end

macro retry(exp)
    :(@retry 3 $exp)
end
