# adapted from https://www.youtube.com/watch?v=vAp6nUMrKYg
struct Dual <: Number
    x::Float64
    y::Float64
end

import Base: +, -, *, /, convert, promote_rule, show

+(a::Dual, b::Dual) = Dual(a.x+b.x, a.y+b.y)
-(a::Dual, b::Dual) = Dual(a.x-b.x, a.y-b.y)

*(a::Dual, b::Dual) = Dual(a.x*b.x, a.y*b.x + a.x*b.y)
/(a::Dual, b::Dual) = Dual(a.x/b.x, (a.y*b.x - a.x*b.y)/(b.x^2))

convert(::Type{Dual}, x::Real) = Dual(x, zero(x))
promote_rule(::Type{Dual}, ::Type{<:Number}) = Dual
show(io::IO, d::Dual) = print(io, d.x, " + ", d.y," ϵ")

f(x) = x^2
f(1)
f(1.0)
f(Dual(1,1))

"""
Compute the square root of x using the Babylonian algorithm
"""
function babylonian(x; nmax = 10)
    t = (1+x)/2
    for i in 2:nmax
        t = (t + x/t)/2
    end
    return t
end

babylonian(π), √π
babylonian(2), √2

# What happens when we pass a Dual number to babylonian?
x = Dual(2,1)

babylonian(x)
√2, 0.5/√2