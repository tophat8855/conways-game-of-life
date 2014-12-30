module Conways
  class Cell
    attr_reader :x_pos, :y_pos, :living
    def initialize(x_pos, y_pos, living)
      @x_pos = x_pos
      @y_pos = y_pos
      @living = false
    end

    def make_living
      @living = true
    end
  end
end
