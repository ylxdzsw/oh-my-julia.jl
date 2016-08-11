Oh-My-Julia
===========

### installation

Run the following code to enhance julia REPL experience.

```
Pkg.clone("git@github.com:ylxdzsw/oh-my-julia.jl.git","OhMyJulia")

using OhMyJulia
```

You can put following code into your `~/.juliarc.jl` to have it load automatically.

```
atreplinit() do repl
    eval(Main, :(using OhMyJulia))
end
```
