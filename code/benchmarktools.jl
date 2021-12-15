### A Pluto.jl notebook ###
# v0.17.3

using Markdown
using InteractiveUtils

# ╔═╡ ebaefdd0-5d91-11ec-0a21-bbe3a1de4c39
using BenchmarkTools

# ╔═╡ c6aa1933-5c9d-4a82-83c6-483ccd4b3f01
function gaxpy_line!(y,A,x)
    (m,n) = size(A)
    for i in 1:m, j in 1:n
        y[i] += A[i,j]*x[j]
    end
end

# ╔═╡ 962e5971-84b8-4186-a1bb-910020957439
function gaxpy_column!(y,A,x)
    (m,n) = size(A)
    for j in 1:n, i in 1:m
        y[i] += A[i,j]*x[j]
    end
end

# ╔═╡ 334c4eac-546e-4f79-87d7-231d85f08f85
begin
	A = rand(50,50)
	x = rand(50)
	y = rand(50)
end

# ╔═╡ bb187913-fa8e-4974-957a-ff26f6967389
@benchmark gaxpy_line!(y,A,x)

# ╔═╡ bd6cbfb1-646b-4306-8bc5-b230949317a3
@benchmark gaxpy_column!(y,A,x)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"

[compat]
BenchmarkTools = "~1.2.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "940001114a0147b6e4d10624276d56d531dd9b49"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.2.2"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═ebaefdd0-5d91-11ec-0a21-bbe3a1de4c39
# ╠═c6aa1933-5c9d-4a82-83c6-483ccd4b3f01
# ╠═962e5971-84b8-4186-a1bb-910020957439
# ╠═334c4eac-546e-4f79-87d7-231d85f08f85
# ╠═bb187913-fa8e-4974-957a-ff26f6967389
# ╠═bd6cbfb1-646b-4306-8bc5-b230949317a3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
