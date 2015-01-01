require 'spec_helper'

describe "Conway's Game of Life" do
  describe 'initializing a cell' do
    it 'returns its position and living status' do
      cell = Conways::Cell.new(10, 12)

      expect(cell.x_pos).to eq(10)
      expect(cell.y_pos).to eq(12)
      expect(cell.living).to eq(false)
    end
  end

  describe 'toggle life' do
    it 'toggles between living and non-living' do
      cell = Conways::Cell.new(5, 5)
      cell.make_living
      cell.toggle_life

      expect(cell.living).to eq(true)
    end

    it 'toggles between dead and undead' do
      cell = Conways::Cell.new(5, 5)
      cell.make_living
      cell.toggle_life

      cell.kill_cell
      cell.toggle_life

      expect(cell.living).to eq(false)
    end
  end
end
