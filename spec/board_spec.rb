require 'spec_helper'

describe Conways::Board do

  describe 'on initialization of a board' do
    it "has 24 rows and 80 columns, or 1920 cells" do
      board = Conways::Board.new(24, 80)

      expect(board.size).to be == 1920
    end

    it "is made of Cell objects" do
      game_board = Conways::Board.new(24, 80)
      cell_classes = game_board.board.map(&:class).uniq

      expect(cell_classes.first).to eq(Conways::Cell)
    end
  end

  describe '#seed' do
    it 'seeds the board with living cells' do
      board = Conways::Board.new(24, 80)
      original_board = board
      srand 33
      seeded_board = board.seed

      expect(original_board).to_not eq(seeded_board)
      expect(seeded_board.size).to eq(1920)
    end
  end

  describe 'cell_at' do
    it 'finds the index of a cell by position' do
      board = Conways::Board.new(24, 80)
      test_cell = board.cell_at(5, 9)

      expect(test_cell.x_pos).to eq(5)
      expect(test_cell.y_pos).to eq(9)
    end
  end

  describe 'cell_neighbors' do
    it "returns the positions of a cell's neighbors" do
      board = Conways::Board.new(24, 80)
      neighbors = board.cell_neighbors(5, 9)

      expect(neighbors.count).to eq(8)
      expect(neighbors[0].x_pos).to eq(4)
      expect(neighbors[0].y_pos).to eq(8)
      expect(neighbors[1].x_pos).to eq(5)
      expect(neighbors[1].y_pos).to eq(8)
      expect(neighbors[2].x_pos).to eq(6)
      expect(neighbors[2].y_pos).to eq(8)
      expect(neighbors[3].x_pos).to eq(4)
      expect(neighbors[3].y_pos).to eq(9)
      expect(neighbors[4].x_pos).to eq(6)
      expect(neighbors[4].y_pos).to eq(9)
      expect(neighbors[5].x_pos).to eq(4)
      expect(neighbors[5].y_pos).to eq(10)
      expect(neighbors[6].x_pos).to eq(5)
      expect(neighbors[6].y_pos).to eq(10)
      expect(neighbors[7].x_pos).to eq(6)
      expect(neighbors[7].y_pos).to eq(10)
    end

    it "returns the positions of a cell's neighbors on an edge" do
      board = Conways::Board.new(24, 80)
      neighbors = board.cell_neighbors(0, 5)
      expect(neighbors.count).to eq(5)
      expect(neighbors[0].x_pos).to eq(0)
      expect(neighbors[0].y_pos).to eq(4)
      expect(neighbors[1].x_pos).to eq(1)
      expect(neighbors[1].y_pos).to eq(4)
      expect(neighbors[2].x_pos).to eq(1)
      expect(neighbors[2].y_pos).to eq(5)
      expect(neighbors[3].x_pos).to eq(0)
      expect(neighbors[3].y_pos).to eq(6)
      expect(neighbors[4].x_pos).to eq(1)
      expect(neighbors[4].y_pos).to eq(6)
    end

    it "returns the positions of a cell's neighbors on an edge" do
      board = Conways::Board.new(24, 80)
      neighbors = board.cell_neighbors(12, 0)

      expect(neighbors.count).to eq(5)
      expect(neighbors[0].x_pos).to eq(11)
      expect(neighbors[0].y_pos).to eq(0)
      expect(neighbors[1].x_pos).to eq(13)
      expect(neighbors[1].y_pos).to eq(0)
      expect(neighbors[2].x_pos).to eq(11)
      expect(neighbors[2].y_pos).to eq(1)
      expect(neighbors[3].x_pos).to eq(12)
      expect(neighbors[3].y_pos).to eq(1)
      expect(neighbors[4].x_pos).to eq(13)
      expect(neighbors[4].y_pos).to eq(1)
    end

    it "returs the positions of a cell's neighbors on a corner" do
      board = Conways::Board.new(24, 80)
      neighbors = board.cell_neighbors(79, 23)
      expect(neighbors.count).to eq(3)
    end

    it "returs the positions of a cell's neighbors on a corner" do
      board = Conways::Board.new(24, 80)
      neighbors = board.cell_neighbors(0, 23)
      expect(neighbors.count).to eq(3)
    end
  end

  describe 'living_neighbors' do
    it 'counts the number of living neighbors of a cell' do
      board = Conways::Board.new(24, 80)
      srand 33 #seeded random with "33" for testing.
      board.seed
      neighbors = board.cell_neighbors(5,5)
      living_neighbors = board.living(neighbors)

      expect(living_neighbors).to eq(3)
    end
  end

  #the following tests are the same as above, but on a 15 x 15 board  
  describe 'on initialization of a board' do
    it "has 15 rows and 15 columns, or 225 cells" do
      board = Conways::Board.new(15, 15)

      expect(board.size).to be == 225
    end

    it "is made of Cell objects" do
      game_board = Conways::Board.new(15, 15)
      cell_classes = game_board.board.map(&:class).uniq

      expect(cell_classes.first).to eq(Conways::Cell)
    end
  end

  describe '#seed' do
    it 'seeds the board with living cells' do
      board = Conways::Board.new(15, 15)
      original_board = board
      srand 33
      seeded_board = board.seed

      expect(original_board).to_not eq(seeded_board)
      expect(seeded_board.size).to eq(225)
    end
  end

  describe 'cell_at' do
    it 'finds the index of a cell by position' do
      board = Conways::Board.new(15, 15)
      test_cell = board.cell_at(5, 9)

      expect(test_cell.x_pos).to eq(5)
      expect(test_cell.y_pos).to eq(9)
    end
  end

  describe 'cell_neighbors' do
    it "returns the positions of a cell's neighbors" do
      board = Conways::Board.new(15, 15)
      neighbors = board.cell_neighbors(5, 9)

      expect(neighbors.count).to eq(8)
      expect(neighbors[0].x_pos).to eq(4)
      expect(neighbors[0].y_pos).to eq(8)
      expect(neighbors[1].x_pos).to eq(5)
      expect(neighbors[1].y_pos).to eq(8)
      expect(neighbors[2].x_pos).to eq(6)
      expect(neighbors[2].y_pos).to eq(8)
      expect(neighbors[3].x_pos).to eq(4)
      expect(neighbors[3].y_pos).to eq(9)
      expect(neighbors[4].x_pos).to eq(6)
      expect(neighbors[4].y_pos).to eq(9)
      expect(neighbors[5].x_pos).to eq(4)
      expect(neighbors[5].y_pos).to eq(10)
      expect(neighbors[6].x_pos).to eq(5)
      expect(neighbors[6].y_pos).to eq(10)
      expect(neighbors[7].x_pos).to eq(6)
      expect(neighbors[7].y_pos).to eq(10)
    end

    it "returns the positions of a cell's neighbors on an edge" do
      board = Conways::Board.new(15, 15)
      neighbors = board.cell_neighbors(0, 5)
      expect(neighbors.count).to eq(5)
      expect(neighbors[0].x_pos).to eq(0)
      expect(neighbors[0].y_pos).to eq(4)
      expect(neighbors[1].x_pos).to eq(1)
      expect(neighbors[1].y_pos).to eq(4)
      expect(neighbors[2].x_pos).to eq(1)
      expect(neighbors[2].y_pos).to eq(5)
      expect(neighbors[3].x_pos).to eq(0)
      expect(neighbors[3].y_pos).to eq(6)
      expect(neighbors[4].x_pos).to eq(1)
      expect(neighbors[4].y_pos).to eq(6)
    end

    it "returns the positions of a cell's neighbors on an edge" do
      board = Conways::Board.new(15, 15)
      neighbors = board.cell_neighbors(12, 0)

      expect(neighbors.count).to eq(5)
      expect(neighbors[0].x_pos).to eq(11)
      expect(neighbors[0].y_pos).to eq(0)
      expect(neighbors[1].x_pos).to eq(13)
      expect(neighbors[1].y_pos).to eq(0)
      expect(neighbors[2].x_pos).to eq(11)
      expect(neighbors[2].y_pos).to eq(1)
      expect(neighbors[3].x_pos).to eq(12)
      expect(neighbors[3].y_pos).to eq(1)
      expect(neighbors[4].x_pos).to eq(13)
      expect(neighbors[4].y_pos).to eq(1)
    end

    it "returs the positions of a cell's neighbors on a corner" do
      board = Conways::Board.new(15, 15)
      neighbors = board.cell_neighbors(14, 14)
      expect(neighbors.count).to eq(3)
    end

    it "returs the positions of a cell's neighbors on a corner" do
      board = Conways::Board.new(15, 15)
      neighbors = board.cell_neighbors(0, 14)
      expect(neighbors.count).to eq(3)
    end
  end

  describe 'living_neighbors' do
    it 'counts the number of living neighbors of a cell' do
      board = Conways::Board.new(15, 15)
      srand 33 #seeded random with "33" for testing.
      board.seed
      neighbors = board.cell_neighbors(5,5)
      living_neighbors = board.living(neighbors)

      expect(living_neighbors).to eq(1)
    end
  end
end
