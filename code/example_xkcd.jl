using Plots
using PyPlot: xkcd

xkcd()
pyplot()

rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
rcParams["font.family"] = ["The Urban Way"]
rcParams["font.size"] = 12.0

x = [0,7,10]
y = [1,1,0]

plot(x, y,
    label="",
    xticks=[],
    yticks=[],
    ylims=[0, 1.2],
    xlabel="Time",
    ylabel="My overall health",
    fontfamily="The Urban Way"
)
annotate!([(5,0.6,text("The day I realised\n I could cook bacon\n whenever I wanted", 9, "The Urban Way"))])
plot!([5,6.99],[0.7,0.99], arrow=:closed, color=:black, label="")
