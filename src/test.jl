#=
Test images for cmocean colormaps.

The design of these images is described in Kovesi (2015),
and illustrated in Figure 2.

https://arxiv.org/abs/1509.03700

51
=#

using PyPlot
include("cmocean.jl")

data = zeros(91,901)

for row in 1:91
	A = 91 - row
	for x in 0:900
		col = x + 1
		data[row,col] = x + A * sin(x * 51/901 * 2pi)
	end
end

figure(1)
clf()
plot(data[1,:], "C0-")


names = ["algae", "amp", "balance", "curl", "deep", "delta",
		"dense", "gray", "haline", "ice", "matter", "oxy",
		"phase", "solar", "speed", "tempo", "thermal", "turbid"]

figure(2, figsize=(10,10))
clf()
for j in 1:9
	for k in [2j-1, 2j]
		subplot(9,2,k)
		title(names[k])
		imshow(data, cmap=names[k])
		xticks([])
		yticks([])
	end
end
