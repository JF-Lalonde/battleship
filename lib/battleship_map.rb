# Starting with a 4x4 map
# Map Dimensions : 4
# Rows    = "A", "B", "C", "D"
# Columns = "1", "2", "3", "4"
# Number of ships = 2
require './lib/grid_square'
class BattleshipMap

  attr_reader :size, :grid

  def initialize(size = 4)
    @size = size
    @grid = Array.new(size).map! do |x|
      Array.new(size).map! do |y|
        GridSquare.new
      end
    end
  end
end
