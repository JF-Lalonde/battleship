require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/start_sequence'

class StartSequenceTest < Minitest::Test
  def test_if_start_screen_is_initiated
    new_game = StartSequence.new
    actual = new_game.start_screen

    refute_nil actual
  end

  def test_if_player_input_calls_other_methods
    new_game = StartSequence.new
    @player_input = "p"
    actual = play
    expected = "Let's start!"
  end

end
