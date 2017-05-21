require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_if_start_sequence_is_initiated
    skip
    new_game = Battleship.new
    actual   = new_game
    expected = StartSequence.new

    assert_equal expected, actual
  end
end
