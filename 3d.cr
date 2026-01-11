require "./shiny/src/shiny.cr"

main = Shiny::Panel.new(width*2, height, "round", "#B0
0B69", "Monitor")

def renderer(x, y, z, char, height, width, focalLenght)
	realx = (width // 2) + (x * focalLenght) // z
	realy = (height // 2) + (y * focalLenght) // z

	main.put(realx, realy, char)
	main.renderBuffer()
end

camHeight = 20
camWidth = 20
camZoom = 10
z = 1

