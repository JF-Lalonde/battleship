require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_if_start_sequence_is_initiated

    new_game = Battleship.new
    actual   = new_game.start_game

    assert_instance_of StartSequence, actual
  end
end
