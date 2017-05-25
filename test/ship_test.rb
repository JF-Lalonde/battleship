require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_types_of_ships
    ship = Ship.new(:first)
    actual = ship.ship_length
    expected = 2

    assert_equal expected, actual
  end

  def test_other_types_of_ships
    ship = Ship.new(:second)
    actual = ship.ship_length
    expected = 3

    assert_equal expected, actual
  end

  def test_that_placed_ships_expand_coords
    ship = Ship.new(:second)
    map = GameMap.new
    ship.place_ship(map, {row: 1, column: 0}, :vertical)
    actual = ship.row
    expected = 4

    assert_equal expected, actual
  end

  def test_that_ships_start_unsunk
    ship = Ship.new(:first)
    actual = ship.sunk?
    expected = false

    assert_equal expected, actual
  end

  def test_that_ships_can_take_hits
    ship = Ship.new(:second)
    ship.hits = 2
    actual = ship.hits
    expected = 2

    assert_equal expected, actual
  end

  def test_that_ships_can_be_sunk
    ship = Ship.new(:first)
    ship.hits = 2
    actual = ship.sunk?
    expected = true

    assert_equal expected, actual
  end

end
