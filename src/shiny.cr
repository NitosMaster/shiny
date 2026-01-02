# TODO: Write documentation for `Shiny`
module Shiny
  VERSION = "0.1.0"

  module Renderable
    abstract def render : Array(String)
  end

  class Text
    include Shiny::Renderable

    def initialize(@lines : Array(String), @textColor : String)
    end

    def render : Array(String)
      @lines
    end
  end

  class FigletText
    include Shiny::Renderable

    def initialize(@text : String, @font : String = "Big Money-nw", @font_dir : String = "/usr/share/figlet/fonts/")
    end

    def render : Array(String)
      if dir = @font_dir
        `figlet -d "#{dir}" -f "#{@font}" "#{@text}"`.strip.split("\n")
      else
        `figlet -f "#{@font}" "#{@text}"`.strip.split("\n")
      end
    end
  end

 struct Cell
  property char : String
  property color : String

 	def initialize(@char = " ", @color = "#FFFFFF")
  end
 end

  class Panel

    @width : Int32
    @height : Int32
    @side : String = ""
    @top : String = ""
    @topLeft : String = ""
    @topRight : String = ""
    @bottomLeft : String = ""
    @bottomRight : String = ""
    @buffer : Array(Array(Cell))

    def hex_to_rgb(hex : String)
      hex = hex.lstrip('#')
      r = hex[0..1].to_i(16)
      g = hex[2..3].to_i(16)
      b = hex[4..5].to_i(16)
      {r, g, b}
    end

    def rgb_to_ansi(hex : String)
      r, g, b = hex_to_rgb(hex)
      "\e[38;2;#{r};#{g};#{b}m"
    end

    def initialize(width : Int32? = nil, @height = 10, @border = "round", @color = "#FFFFFF", @title = "")
      @width = width || `tput cols`.to_i rescue 80

      if @border == "round"
        @side = "│"
        @top = "─"
        @topLeft = "╭"
        @topRight = "╮"
        @bottomLeft = "╰"
        @bottomRight = "╯"
      end

      if @border == "square"
        @side = "│"
        @top = "─"
        @topLeft = "┌"
        @topRight = "┐"
        @bottomLeft = "└"
        @bottomRight = "┘"
      end

      if @border == "double"
        @side = "║"
        @top = "═"
        @topLeft = "╔"
        @topRight = "╗"
        @bottomLeft = "╚"
        @bottomRight = "╝"
      end

      if @border == "bold"
        @side = "┃"
        @top = "━"
        @topLeft = "┏"
        @topRight = "┓"
        @bottomLeft = "┗"
        @bottomRight = "┛"
      end

      if @border == "dashed"
        @side = "┆"
        @top = "┄"
        @topLeft = "┌"
        @topRight = "┐"
        @bottomLeft = "└"
        @bottomRight = "┘"
      end

      if @border == "ascii"
        @side = "|"
        @top = "-"
        @topLeft = "+"
        @topRight = "+"
        @bottomLeft = "+"
        @bottomRight = "+"
      end

     	@buffer = Array(Array(Cell)).new(@height - 2) do
      	Array(Cell).new(@width - 2) { Cell.new }
			end
    end

    def render(content : Renderable)
      lines = content.render
      head = " #{@title} "

      remaining = @width - 2 - head.size
      leftPad = remaining // 2
      rightPad = remaining - leftPad

      print rgb_to_ansi(@color)
      print @topLeft
      if !@title.empty?
        print @top * leftPad
        print head
        print @top * rightPad
      else
        print @top * (@width - 2)
      end
      puts @topRight

      (@height - 2).times do |i|
        print @side
        if i < lines.size
          line = lines[i][0...(@width - 2)].ljust(@width - 2)
          print line
        else
          print " " * (@width - 2)
        end
        puts @side
      end

      print @bottomLeft
      print @top * (@width - 2)
      puts @bottomRight
      print "\e[0m"
    end

		def put(x : Int32, y : Int32, text : String, color : String = "#FFFFFF")
  		text.each_char_with_index do |char, i|
    		col = x + i
    		break if col >= @width - 2
    		break if y >= @height - 2
    		@buffer[y][col] = Cell.new(char.to_s, color)
  		end
		end

    def renderBuffer()
      head = @title.empty? ? "" : " #{@title} "

      remaining = @width - 2 - head.size
      leftPad = remaining // 2
      rightPad = remaining - leftPad

			print rgb_to_ansi(@color)
    	print @topLeft
    	if !@title.empty?
      	print @top * leftPad
      	print head
      	print @top * rightPad
    	else
      	print @top * (@width - 2)
    	end
    	puts @topRight

			@buffer.each do |row|
				print rgb_to_ansi(@color)
				print @side
			  row.each do |cell|
				  print rgb_to_ansi(cell.color)
				  print cell.char
        end
        print rgb_to_ansi(@color)
        puts @side
			end

			print @bottomLeft
    	print @top * (@width - 2)
    	puts @bottomRight
    	print "\e[0m"
    end
  end
end
