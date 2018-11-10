Oh-My-Julia
===========

### installation

```
julia> ] # this brings you to the pkg>
(v1.0) pkg> add https://github.com/ylxdzsw/oh-my-julia.jl
```

You can put following code into your `~/.julia/config/startup.jl` to load it automatically.

```
atreplinit() do repl
    Core.eval(Main, :(using OhMyJulia))
end
```
