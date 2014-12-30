require 'spec_helper'

describe "Conway's Game of Life" do
  describe 'initializing a cell' do
    it 'returns its position and living status' do
      cell = Conways::Cell.new(10, 12, false)

      expect(cell.x_pos).to eq(10)
      expect(cell.y_pos).to eq(12)
      expect(cell.living).to eq(false)
    end
  end
end
