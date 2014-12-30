module Conways
  class Board
    attr_reader :board, :living
    def initialize
      columns = Array(0..79)
      rows = Array(0..23)

      @board = []
      columns.each do |row|
        rows.each do |column|
          @board << Cell.new(column, row, false)
        end
      end

      @living = @board.select { |cell| cell.living == true }
    end

    def size
      @board.length
    end

    def cells
      @board
    end

    def seed
      indices_to_seed = 192.times.map{ rand(1920) }

      indices_to_seed.each do |index|
        @board[index].make_living
      end

      @board
    end
  end
end
