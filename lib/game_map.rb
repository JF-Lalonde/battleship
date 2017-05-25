require './lib/grid_square'

class GameMap

  attr_reader :size,
              :grid

  def initialize(size = 4)
    @size = size
    @starting_ships = 2
    @grid = Array.new(size).map! do |y|
      Array.new(size).map! do |x|
        GridSquare.new
      end
    end
  end

  def ship_within_map?(ship, start_coordinate, orientation)
    if ship == :first
      length = 2
    else
      length = 3
    end
    if orientation == :vertical
      (start_coordinate[:row] + length) <= size
    elsif orientation == :horizontal
      (start_coordinate[:column] + length) <= size
    else
      false
    end
  end

  def check_clearance?(ship, start_coordinate, orientation)
    if ship == :first
      length = 2
    else
      length = 3
    end
    row = start_coordinate[:row]
    column = start_coordinate[:column]
    length.times do
      if @grid[row][column].hitbox != :empty
        false
      elsif orientation == :horizontal
        column += 1
      else
        row += 1
      end
    end
    true
  end
end
