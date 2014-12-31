require "./lib/board"
require "./lib/cell"

board = Conways::Board.new
board.seed


board.print_board
gets.chomp
