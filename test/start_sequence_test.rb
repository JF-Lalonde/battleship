require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/start_sequence'

class StartSequenceTest < Minitest::Test
  def test_if_start_screen_has_text
    new_game = StartSequence.new
    expected = "Welcome"
    actual   = new_game

    assert_equal expected, actual
  end
end
