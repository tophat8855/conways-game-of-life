require "./lib/board"
require "./lib/cell"

board = Conways::Board.new
board.seed

while true
  sleep(0.3)
  board.print_board
  board.ready_board
end
