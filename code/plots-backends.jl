### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ 44e51e69-e12b-479f-a630-3f8be3461112
using Pkg; Pkg.activate()

# ╔═╡ 4e322516-2838-11ec-3ceb-c5bfb1e357bc
begin
	using Plots
end

# ╔═╡ f24068a4-992a-434c-b9af-633373f5e67f
md"# Plots.jl Backends"

# ╔═╡ f5826703-a88f-4b2b-b3f6-ff5242894251
md"""
> **NB** You need to install the different backends (PlotlyJS, PyPlot, PGFPlotsX, Gaston) separately
"""

# ╔═╡ 0571dd1a-4488-4a2f-932a-155a2e48be92
begin
	gr()
	plot(rand(15), label="Buzz", title="GR")
end

# ╔═╡ df8bc50d-afe1-4b62-9a30-1b7ae1cc3c45
begin
	plotlyjs()
	plot(rand(15), label="Foo", title="PlotlyJS")
end

# ╔═╡ b27088ee-7bab-4f39-8de6-d2b1fe50226d
begin
	pyplot()
	plot(rand(15), label="Bar", title="PyPlot")
end

# ╔═╡ cd2c9a51-06bb-46f2-ab3f-02abab022a8a
begin
	pgfplotsx()
	plot(rand(15), label="Baz", title="PGFPlotsX")
end

# ╔═╡ a5589144-1762-4f63-8020-8ea90965630e
begin
	gaston()
	plot(rand(15), label="Qux", title="Gaston (Gnuplot)")
end

# ╔═╡ Cell order:
# ╟─f24068a4-992a-434c-b9af-633373f5e67f
# ╟─f5826703-a88f-4b2b-b3f6-ff5242894251
# ╠═44e51e69-e12b-479f-a630-3f8be3461112
# ╠═4e322516-2838-11ec-3ceb-c5bfb1e357bc
# ╠═0571dd1a-4488-4a2f-932a-155a2e48be92
# ╠═df8bc50d-afe1-4b62-9a30-1b7ae1cc3c45
# ╠═b27088ee-7bab-4f39-8de6-d2b1fe50226d
# ╠═cd2c9a51-06bb-46f2-ab3f-02abab022a8a
# ╠═a5589144-1762-4f63-8020-8ea90965630e
