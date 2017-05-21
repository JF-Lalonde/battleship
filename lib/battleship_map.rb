# Starting with a 4x4 map
class BattleshipMap

  attr_reader :size,
              :x_coords,
              :y_coords

  def initialize(size = 4)
    @size = size
    grid(size)
  end

  def grid(size)
    @x_coords = Array.new(size, ".")
    @y_coords = Array.new(size, ".")
  end
end
