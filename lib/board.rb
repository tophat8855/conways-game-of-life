module Conways
  class Board
    attr_reader :board, :living
    def initialize
      @columns = Array(0..79) #could make this something user chooses
      @rows = Array(0..23)

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
      indices_to_seed = 192.times.map{ rand(1920) } #if user can choose board size, this needs seed 1/10 of cells
      indices_to_seed.each do |index|
        @board[index].make_living
        @board[index].toggle_life
      end

      @board
    end

    def cell_at(x,y)
      @board[x * 24 + y] #if user can choose board size, the 24 needs to be # of rows
    end

    def cell_neighbors(x,y)
      neighbors = [cell_at(x-1,y-1), cell_at(x, y-1), cell_at(x+1, y-1), cell_at(x-1, y), cell_at(x+1, y), cell_at(x-1, y+1), cell_at(x, y+1), cell_at(x+1, y+1)]
      if x == 0
        neighbors.delete(cell_at(-1, y-1))
        neighbors.delete(cell_at(-1, y))
        neighbors.delete(cell_at(-1, y+1))
      end
      if x == 79
        neighbors.delete(cell_at(80, y-1)) #maxes need to reflect # of columns
        neighbors.delete(cell_at(80, y))
        neighbors.delete(cell_at(80, y+1))
      end
      if y == 0
        neighbors.delete(cell_at(x-1, -1))
        neighbors.delete(cell_at(x, -1))
        neighbors.delete(cell_at(x+1, -1))
      end
      if y == 23
        neighbors.delete(cell_at(x-1, 24)) #maxes need to reflect # of rows
        neighbors.delete(cell_at(x, 24))
        neighbors.delete(cell_at(x+1, 24))
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
