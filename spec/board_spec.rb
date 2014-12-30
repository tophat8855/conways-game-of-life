require 'spec_helper'

describe Conways::Board do

  describe 'on initialization of a board' do
    it "has 24 rows and 80 columns, or 1920 cells" do
      board = Conways::Board.new

      expect(board.size).to be == 1920
    end

    it "is made of Cell objects" do
      board = Conways::Board.new
      cell_classes = board.cells.map(&:class).uniq

      expect(cell_classes.first).to eq(Conways::Cell)
    end
  end

  describe '#seed' do
    it 'seeds the board with living cells' do
      board = Conways::Board.new

      original_board = board
      seeded_board = board.seed

      expect(original_board).to_not eq(seeded_board)
      expect(seeded_board.size).to eq(1920)
    end
  end
end
