require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class StartSequenceTest < Minitest::Test
  def test_if_start_screen_has_text
    new_game = StartSequence.new(stuff)
    expected = "Welcome"
    actual   = sequence
    assert_equal expected, actual
  end
end
