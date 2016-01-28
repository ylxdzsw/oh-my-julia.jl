Oh-My-Julia
===========

#### macro.jl
	- @map, @map!, @reduce, @filter, @filter!: curried, expression-baed version for these functions. eg. `1:7 |> @map(x*x) |> @reduce(x+y) |> show`

#### r.jl
	- ncol, nrow: R-like version of Base.size

#### currying.jl
	- map, map!, reduce, filter, filter!: currying version of these functions in Base. eg. `1:233 |> filter(isprime) |> reduce(*) |> show`