require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship_map'

class BattleshipMapTest < Minitest::Test
  def test_that_map_starts_at_correct_size
    new_map = BattleshipMap.new(5)
    actual = new_map.size
    expected = 5

    assert_equal expected, actual
  end

  def test_that_grid_is_correct_size
    new_map = BattleshipMap.new(3)
    actual = new_map.grid.length
    expected = 3

    assert_equal expected, actual
  end

  def test_that_grid_contains_grid_square_class
    new_map = BattleshipMap.new
    actual = new_map.grid[0][1].class
    expected = GridSquare

    assert_equal expected, actual
  end

end
