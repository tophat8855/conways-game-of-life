module Conways
  class Cell
    attr_reader :x_pos, :y_pos, :living
    def initialize(x_pos, y_pos)
      @x_pos = x_pos
      @y_pos = y_pos
      @living = false
      @to_be = false
    end

    def make_living
      @to_be = true
    end

    def kill_cell
      @to_be = false
    end

    def toggle_life
      @living = @to_be
    end
  end
end
