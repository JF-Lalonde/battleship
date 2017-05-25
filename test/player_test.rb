require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_if_player_starts_with_a_name
    player = Player.new("JF")
    actual = player.name
    expected = "JF"

    assert_equal expected, actual
  end

  def test_if_player_starts_with_ships
    player = Player.new("Mike")
    actual = player.ships_left
    expected = 2

    assert_equal expected, actual
  end

end
