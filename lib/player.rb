require './lib/ship'
require './lib/grid_square'

class Player
  attr_reader :game_map,
              :first,
              :second,
              :name

  attr_accessor :ships_left,
                :target_board

  def initialize(name)
    @name = name
    @game_map = GameMap.new
    @target_board = GameMap.new
    @first = Ship.new(:first)
    @second = Ship.new(:second)
    @ships_left = 2
  end

  def to_screen
    @name
  end

  def print_boards
    puts "============================================="
    puts "============================================="
    rows = ("A".."Z").to_a
    columns = (1..4).to_a
    columns.map!{|i| i.to_s}
    puts "                 " + columns.join(" ")
    @target_board.grid.each_with_index do |x, i|
      print "               " + rows[i] + " "
      x.each do |square|
        print square.hitbox_status + " "
      end
        print "\n"
    end

    print "\n\n"
    @y_axis = []
    axis_y = ("A".."Z").to_a
    x_axis = (1..4).to_a
    @x_axis = x_axis.map!{|i| i.to_s}
    puts "                 " + @x_axis.join(" ")
    @game_map.grid.each_with_index do |x, i|
      @y_axis << axis_y[i]
      print "               " + axis_y[i] + " "
      x.each do |square|
        print square.hitbox_status + " "
      end
        print "\n"
    end
    puts "============================================="
    puts "============================================="
  end
end
