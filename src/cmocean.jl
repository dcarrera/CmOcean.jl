#=
Create all the colormaps from cmocean and register them with
Matplotlib.

Example:
	include("path/to/cmocean.jl")
	
	imshow(Z, cmap="ice")

WARNING: This script overwrites the "gray" colormap from Matplotlib.
         The one from cmocean has a slightly longer range. If you
         don't want that, just delete "gray" below.

=#
using PyPlot
using CSV

for name in ["algae", "amp", "balance", "curl", "deep", "delta",
	"dense", "gray", "haline", "ice", "matter", "oxy",
	"phase", "solar", "speed", "tempo", "thermal", "turbid"]
	
	path = "$(@__DIR__)/rgb/$name-rgb.txt"
	df = CSV.read(path,header=false,delim=' ')
	raw = convert(Array{Float64,2},df)
	
	cm = ColorMap(name, raw)
	plt[:register_cmap](name=name,cmap=cm)
	
	cm = ColorMap(name*"_r", raw[end:-1:1,:])
	plt[:register_cmap](name=name*"_r",cmap=cm)
end
