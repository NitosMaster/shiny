require "./src/shiny.cr"

width = 40
height = 40

panel = Shiny::Panel.new(width*2, height, "round", "#B0
0B69", "Monitor")

def render(panel, x, y, z, char, height, width, focalLenght)
	realx = (width // 2) + (x * focalLenght) // z
	realy = (height // 2) + (y * focalLenght) // z

	panel.put(realx, realy, char)
  panel.renderBuffer()
end

camHeight = 40
camWidth = 40
camZoom = 10
x = 3
y = 4
z = 1

render(panel, x, y, z, "n", camHeight, camWidth, camZoom)
