# gem install colorize
require "colorize"

class Pen
  attr_reader :color
  # def color
  #   @color
  # end

  def initialize color
    @color = color
  end

  def write text
    # If color is "red", this is equivalent to text.red
    puts text.send(color)
  end
end

class ClickyPen < Pen
  # Can change color
  attr_writer :color
  #def color= new_color <- argument to color
  #  @color = new_color
  #end
end
