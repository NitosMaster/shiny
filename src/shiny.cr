# TODO: Write documentation for `Shiny`
module Shiny
  VERSION = "0.1.0"

  module Renderable

  end

  class Panel
		@side : String
  	@top : String
  	@topLeft : String
  	@topRight : String
  	@bottomLeft : String
  	@bottomRight : String

    def initialize(width : Int32? = nil, @height = 10, @border = "round", @color = "white", @title = "")
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
    end

    def render

    end

    def render(content : Renderable? = nil)

      head = " #{@title} "
 # thats ↑ what she said
      remaining = @width - 2 - head.size
      leftPad = remaining / 2
      rightPad = remaining - leftPad

      if content == nil
        print @topLeft
        if !@title.empty?
          print @top * leftPad.to_i
          print head
          print @top * rightPad.to_i
        else
          print @top * (@width - 2)
        end
        puts @topRight
        (@height - 2).times do
          print @side
          print " " * (@width -2)
          puts @side
        end
        print @bottomLeft
        print @top * (@width - 2)
        puts @bottomRight
      end
    end
  end
end
