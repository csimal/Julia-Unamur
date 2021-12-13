using DataFrames
using Gadfly
using CSV
using StatsBase
using ColorTypes

# Code taken from https://julialang.org/benchmarks/

benchmarks = CSV.read("benchmarks.csv", DataFrame; header=["language", "benchmark", "time"])

# Capitalize and decorate language names from datafile
dict = Dict("c"=>"C", "julia"=>"Julia", "lua"=>"LuaJIT", "fortran"=>"Fortran", "java"=>"Java",
    "javascript"=>"JavaScript", "matlab"=>"Matlab", "mathematica"=>"Mathematica",
    "python"=>"Python", "octave"=>"Octave", "r"=>"R", "rust"=>"Rust", "go"=>"Go");
benchmarks[!,:language] = [dict[lang] for lang in benchmarks[!,:language]]

# Normalize benchmark times by C times
ctime = benchmarks[benchmarks[!,:language].== "C", :]
benchmarks = innerjoin(benchmarks, ctime, on=:benchmark, makeunique=true)
select!(benchmarks, Not(:language_1)) # delete column language_1
rename!(benchmarks, :time_1 =>:ctime)
benchmarks[!,:normtime] = benchmarks[!,:time] ./ benchmarks[!,:ctime];

# Compute the geometric mean for each language
langs = [];
means = [];
priorities = [];
for lang in values(dict)
    data = benchmarks[benchmarks[!,:language].== lang, :]
    gmean = geomean(data[!,:normtime])
    push!(langs, lang)
    push!(means, gmean)
    if (lang == "C")
        push!(priorities, 1)
    elseif (lang == "Julia")
        push!(priorities, 2)
    else
        push!(priorities, 3)
    end
end

# Add the geometric means back into the benchmarks dataframe
langmean = DataFrame(language=langs, geomean = means, priority = priorities)
benchmarks = innerjoin(benchmarks, langmean, on=:language)

# Put C first, Julia second, and sort the rest by geometric mean
sort!(benchmarks, [:priority, :geomean]);
sort!(langmean,   [:priority, :geomean]);

p = plot(benchmarks,
    x = :language,
    y = :normtime,
    color = :benchmark,
    Scale.y_log10,
    Guide.ylabel(nothing),
    Guide.xlabel(nothing, :vertical),
    Coord.Cartesian(xmin=1,xmax=13.3,ymin=-0.5,ymax=4.2),
    Theme(
        guide_title_position = :left,
        colorkey_swatch_shape = :circle,
        minor_label_color = colorant"white",
        major_label_color = colorant"white",
        key_label_color = colorant"white",
        key_title_color = colorant"white",
        minor_label_font_size = 12pt,
        major_label_font_size = 12pt,
        key_label_font_size = 12pt,
        key_title_font_size = 13pt,
        highlight_width = 0pt
    ),
)

golden = (1+√5)/2
draw(SVG(8inch,8inch/golden), p)
draw(SVG("benchmarks_dark.svg", 8inch, 8inch/golden), p)
draw(PNG("../images/benchmark.png", 9inch, 9inch/golden), p)
