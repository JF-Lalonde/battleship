# Starting with a 4x4 map
# Map Dimensions : 4
# Rows    = "A", "B", "C", "D"
# Columns = "1", "2", "3", "4"
# Number of ships = 2
require './lib/grid_square'
class BattleshipMap

  attr_reader :size, :grid, :x_axis

  def initialize(size = 4)
    @size = size
    @grid = Array.new(size).map! do |y|
      Array.new(size).map! do |x|
        GridSquare.new
      end
    end
    show_map
  end

  def show_map
    y_axis = ("A".."Z").to_a
    @x_axis = (1..size).to_a
    puts "  " + x_axis.join(" ")
    @grid.each_with_index do |x, i|
      print y_axis[i] + " "
      x.each do |square|
        print square.hitbox_status + " "
      end
        print "\n"
    end
  end
end
