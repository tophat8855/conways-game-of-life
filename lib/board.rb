module Conways
  class Board
    attr_reader :board, :living, :length, :width
    def initialize(length, width)
      @length = length.to_i
      @width = width.to_i
      @columns = Array(0..(@width - 1))
      @rows = Array(0..(@length - 1))

      @board = []
      @columns.each do |column|
        @rows.each do |row|
          @board << Cell.new(column, row)
        end
      end
    end

    def size
      @board.length
    end

    def seed
      tenth_of_board = @board.size/10
      indices_to_seed = tenth_of_board.times.map{ rand(@board.size) }
      indices_to_seed.each do |index|
        @board[index].make_living
        @board[index].toggle_life
      end

      @board
    end

    def cell_at(x,y)
      @board[x * @length + y]
    end

    def cell_neighbors(x,y)
      neighbors = [cell_at(x-1,y-1), cell_at(x, y-1), cell_at(x+1, y-1), cell_at(x-1, y), cell_at(x+1, y), cell_at(x-1, y+1), cell_at(x, y+1), cell_at(x+1, y+1)]
      if x == 0
        neighbors.delete(cell_at(-1, y-1))
        neighbors.delete(cell_at(-1, y))
        neighbors.delete(cell_at(-1, y+1))
      end
      if x == (@width - 1)
        neighbors.delete(cell_at(@width, y-1))
        neighbors.delete(cell_at(@width, y))
        neighbors.delete(cell_at(@width, y+1))
      end
      if y == 0
        neighbors.delete(cell_at(x-1, -1))
        neighbors.delete(cell_at(x, -1))
        neighbors.delete(cell_at(x+1, -1))
      end
      if y == (@length - 1)
        neighbors.delete(cell_at(x-1, @length))
        neighbors.delete(cell_at(x, @length))
        neighbors.delete(cell_at(x+1, @length))
      end
      neighbors
    end

    def living(neighbor_array)
      neighbor_array.count { |cell| cell.living == true }
    end

    def ready_board
      @board.each do |cell|
        cells_neighbors = self.cell_neighbors(cell.x_pos, cell.y_pos)
        living_neighbor_number = self.living(cells_neighbors)
        if cell.living == true && living_neighbor_number < 2
          cell.kill_cell
        elsif cell.living == true && living_neighbor_number > 3
          cell.kill_cell
        elsif cell.living == false && living_neighbor_number == 3
          cell.make_living
        end
      end

      @board.each do |cell|
        cell.toggle_life
      end
    end

    def print_board
      dead = " "
      alive = "*"

      @rows.each do |row|
        row_to_puts = ""
        @columns.each do |column|
          cell = cell_at(column, row)
          if cell.living == true
            row_to_puts << alive
          else
            row_to_puts << dead
          end
        end
        puts row_to_puts
      end
    end
  end
end
