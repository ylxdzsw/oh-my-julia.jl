import Base.Callable

export ∘

∘(f::Callable, g::Callable) = x->f(g(x))
