require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require './lib/ship'

class BattleshipTest < Minitest::Test
  def test_if_start_sequence_is_initiated
    new_game = Battleship.new
    actual   = new_game.start_sequence

    assert_instance_of StartSequence, actual
  end

  def test_if_random_shots_are_generated_for_every_position
    new_game = Battleship.new
    actual = new_game.start_ai.length
    expected = 16

    assert_equal expected, actual
  end
end
