require "./shiny/src/shiny.cr"

struct Vertex
  property x, y, z : Float64
  property color : String
  property char : String

  def initialize(@x, @y, @z, @char = "#", @color = "#FFFFFF")
  end
end


def renderer(x, y, z, char, height, width, focalLenght)
	realx = (width // 2) + (x * focalLenght) // z
	realy = (height // 2) + (y * focalLenght) // z

	main = Shiny::Panel.new(width*2, height, "round", "#B00B69", "Monitor")
	main.put(realx, realy, char)
	main.renderBuffer()
end

camHeight = 20
camWidth = 20
camZoom = 10
z = 1

