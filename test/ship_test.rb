require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_types_of_ships
    ship = Ship.new(:first)
    actual = ship.length
    expected = 2

    assert_equal expected, actual
  end

  def test_other_types_of_ships
    ship = Ship.new(:second)
    actual = ship.length
    expected = 3

    assert_equal expected, actual
  end

end
