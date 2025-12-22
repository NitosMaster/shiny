# TODO: Write documentation for `Shiny`
module Shiny
  VERSION = "0.1.0"

  module Renderable
    abstract def render : Array(String)
  end

  class Text
    include Shiny::Renderable

    def initialize(@lines : Array(String))
    end

    def render : Array(String)
      @lines
    end

    #def render : Array(String)
      #[@content]
    #end
  end

  class Panel
		def hex_to_rgb(hex : String)
      hex = hex.lstrip('#')

      r = hex[0..1].to_i(16)  # First 2 chars
      g = hex[2..3].to_i(16)  # Middle 2 chars
      b = hex[4..5].to_i(16)  # Last 2 chars

      {r, g, b}
    end

    def rgb_to_ansi(hex : String)
      r, g, b = hex_to_rgb(hex)
      "\e[38;2;#{r};#{g};#{b}m"
    end

    def initialize(width : Int32? = nil, @height = 10, @border = "round", @color = "#FFFFFF", @title = "")
        @width = width || `tput cols`.to_i

        @side = "│"
  			@top = "─"
  			@topLeft = "╭"
  			@topRight = "╮"
  			@bottomLeft = "╰"
 	 			@bottomRight = "╯"

        if @border == "round"
          @side = "│"
          @top = "─"
          @topLeft = "╭"
          @topRight = "╮"
          @bottomLeft = "╰"
          @bottomRight = "╯"
        end

        #if @width.odd?
          #@width += 1
        #end
   end

    def render(content : Renderable)

      lines = content.render
      head = " #{@title} "
 # thats ↑ what she said
      remaining = @width - 2 - head.size
      leftPad = remaining / 2
      rightPad = remaining - leftPad

      print rgb_to_ansi(@color)
      print @topLeft
      if !@title.empty?
        print @top * leftPad.to_i
        print head
        print @top * rightPad.to_i
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
          print " " * (@width -2)
        end
        puts @side
      end
      print @bottomLeft
      print @top * (@width - 2)
      puts @bottomRight
      print "\e[0m"
    end
  end
end
