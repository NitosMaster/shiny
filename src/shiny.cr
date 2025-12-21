# TODO: Write documentation for `Shiny`
module Shiny
  VERSION = "0.1.0"

  terminal-x, terminal-y = 'tput lines'.to_i, 'tput cols'.to_i

  module Renderable

  end

  class panel

    def initialize(@width = terminal-x, @height, @border = "round", @color = "white", @title = "")

    end

    def render

    end

    def render(content : Renderable)

    end
  end
end
