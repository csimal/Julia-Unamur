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
