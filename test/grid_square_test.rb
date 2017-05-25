require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/grid_square'

class GridSquareTest < Minitest::Test
  def test_that_hitbox_is_empty_by_default
    new_square = GridSquare.new
    expected = :empty
    actual = new_square.hitbox

    assert_equal expected, actual
  end

  def test_that_hitbox_status_can_change
    new_square = GridSquare.new
    new_square.hitbox = :first
    actual = new_square.hitbox_status
    expected = "F"

    assert_equal expected, actual
  end

  def test_that_hit_changes_hitbox
    new_square = GridSquare.new
    actual = new_square.hit
    expected = :hit

    assert_equal expected, actual
  end

  def test_that_miss_changes_hitbox
    new_square = GridSquare.new
    actual = new_square.miss
    expected = :miss

    assert_equal expected, actual
  end
end
