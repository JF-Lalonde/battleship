require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_map'
require './lib/ship'

class GameMapTest < Minitest::Test
  def test_that_map_starts_at_correct_size
    new_map = GameMap.new(4)
    actual = new_map.size
    expected = 4

    assert_equal expected, actual
  end

  def test_that_map_can_change_size
    new_map = GameMap.new(6)
    actual = new_map.size
    expected = 6

    assert_equal expected, actual
  end

  def test_that_grid_is_correct_size
    new_map = GameMap.new(4)
    actual = new_map.grid.length
    expected = 4

    assert_equal expected, actual
  end

  def test_that_grid_can_change_size
    new_map = GameMap.new(7)
    actual = new_map.grid.length
    expected = 7

    assert_equal expected, actual
  end

  def test_that_grid_contains_grid_square_class
    new_map = GameMap.new
    actual = new_map.grid[0][1].class
    expected = GridSquare

    assert_equal expected, actual
  end

  def test_if_ship_is_within_map
    new_map = GameMap.new
    ship = Ship.new(:first)

    assert new_map.ship_within_map?(ship,{row: 1, column: 0}, :vertical)
  end

  def test_if_ship_is_outside_of_map
    new_map = GameMap.new
    ship = Ship.new(:second)
    actual = new_map.ship_within_map?(ship,{row: 7, column: 6}, :horizontal)

    refute actual
  end
end
