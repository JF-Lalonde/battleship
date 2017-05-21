require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship_map'

class BattleshipMapTest < Minitest::Test
  def test_that_map_starts_at_correct_size
    new_map = BattleshipMap.new(4)
    actual = new_map.size
    expected = 4

    assert_equal expected, actual
  end

  def test_that_coords_arrays_are_correct_size
    new_map = BattleshipMap.new(5)
    actual = new_map.x_coords.length
    expected = 5
    
    assert_equal expected, actual
  end
end
