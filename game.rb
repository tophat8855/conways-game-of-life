require "./lib/board"
require "./lib/cell"

puts "Length of Board?"
length = gets.chomp
puts "Width of Board?"
width = gets.chomp

board = Conways::Board.new(length, width)
board.seed

while true
  sleep(0.5)
  board.print_board
  board.ready_board
end
