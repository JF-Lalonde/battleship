require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid_square'

class GridSquareTest < Minitest::Test
  def test_that_hitbox_is_dot_by_default
    new_square = GridSquare.new
    expected = "."
    actual = new_square.hitbox

    assert_equal expected, actual
  end
end
