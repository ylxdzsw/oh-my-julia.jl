Oh-My-Julia
===========

### installation

```
Pkg.clone("https://github.com/ylxdzsw/oh-my-julia.jl","OhMyJulia")
```

You can put following code into your `~/.juliarc.jl` to have it load automatically.

```
atreplinit() do repl
    eval(Main, :(using OhMyJulia))
end
```
