module Conways
  class Cell
    attr_reader :x_pos, :y_pos, :living, :to_die
    def initialize(x_pos, y_pos, living, to_die)
      @x_pos = x_pos
      @y_pos = y_pos
      @living = false
      @to_die = false
    end

    def make_living
      @living = true
    end
  end
end
