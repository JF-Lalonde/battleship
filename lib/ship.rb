require './lib/game_map'

class Ship

  attr_reader :ship_length,
              :type,
              :row

  attr_accessor :hits

  def initialize(type)
      @type = type
      @hits = 0
    if @type == :first
      @ship_length = 2
    else
      @ship_length = 3
    end
  end

  def place_ship(game_map, start_coordinate, orientation)
    @row = start_coordinate[:row]
    column = start_coordinate[:column]
    @ship_length.times do
      if orientation == :vertical
        game_map.grid[row][column].hitbox = @type
        @row += 1
      else
        game_map.grid[row][column].hitbox = @type
        column += 1
      end
    end
  end

  def sunk?
    @ship_length == @hits
  end

  def hit
    @hits += 1
  end
end
