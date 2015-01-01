require "./lib/board"
require "./lib/cell"

board = Conways::Board.new
board.seed

puts "Ready? Type 'quit' to exit"
puts "Keep pressing 'return' to go to next stage"
continue = gets.chomp

while continue != 'quit'
  board.print_board
  continue = gets.chomp
  board.ready_board
end
