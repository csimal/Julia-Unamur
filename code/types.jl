using GraphRecipes # a graph vizualization package built ontop of Plots
using Plots
default(size=(1400,1000))

plot(AbstractFloat, method=:tree, fontsize=12, nodeshape=:ellipse)

savefig("types.png")
