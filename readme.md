Oh-My-Julia
===========

Just run following code to make your julia REPL experience better

```
Pkg.clone("git@github.com:ylxdzsw/oh-my-julia.jl.git","OhMyJulia")

using OhMyJulia
```

#### macro.jl
- `@map`, `@map!`, `@reduce`, `@filter`, `@filter!`: curried, expression-baed version for these functions. eg. `1:7 |> @map(x*x) |> @reduce(x+y) |> show`

#### r.jl
- `ncol`, `nrow`: R-like version of `Base.size`

#### currying.jl
- `map`, `map!`, `reduce`, `filter`, `filter!`: currying version of these functions. eg. `1:233 |> filter(isprime) |> reduce(*) |> show`