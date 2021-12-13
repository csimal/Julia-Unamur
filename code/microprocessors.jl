using Gadfly
using DelimitedFiles
using DataFrames
using ColorTypes

cores = readdlm("../data/cores.dat", Float64, comment_char='#')
frequency = readdlm("../data/frequency.dat", Float64, comment_char='#')
specint = readdlm("../data/specint.dat", Float64, comment_char='#')
transistors = readdlm("../data/transistors.dat", Float64, comment_char='#')
watts = readdlm("../data/watts.dat", Float64, comment_char='#')

df = vcat(
    DataFrame(Year=transistors[:,1], y=transistors[:,2], label="#Transistors\n (thousands)"),
    DataFrame(Year=specint[:,1], y=specint[:,2], label="Single Thread\n Performance\n (SpecINT x 10³)"),
    DataFrame(Year=frequency[:,1], y=frequency[:,2], label="Frequency \n(MHz)"),
    DataFrame(Year=watts[:,1], y=watts[:,2], label="Power (Watts)"),
    DataFrame(Year=cores[:,1], y=cores[:,2], label="#Cores"),
)

p = Gadfly.plot(df,
    x = :Year,
    y = :y,
    size = [0.5mm],
    color = :label,
    #shape = :label,
    Scale.y_log10,
    Guide.title("Microprocessors metrics"),
    Guide.ylabel(nothing),
    Guide.colorkey(title=""),
    Coord.cartesian(ymin = -1, ymax=8),
    Geom.point,
    Geom.smooth,
    Theme(
        minor_label_color = colorant"white",
        major_label_color = colorant"white",
        key_label_color = colorant"white",
        highlight_width = 0.5pt
    )
)

p |> SVG("../images/microprocessors.svg", 15cm, 9cm)
p |> PNG("../images/microprocessors.png", 15cm, 9cm)