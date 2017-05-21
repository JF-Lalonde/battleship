#Runner file initiated when battleship.rb is called
#Calls all corresponding classes in the correct sequence
#Order of flow:
# 1. Start sequence class initiated
# 2. Battleship Map class initiated
# 3. Computer Player class initiated
# 4. Human Player class initiated
# 5. Game class initiated
# 6. End sequence class initiated

# BattleshipMap.new
# ComputerPlayer.new
# HumanPlayer.new
# EndSequence.new
require './lib/start_sequence'

class Battleship
  def initialize
    @start_game = start_game
  end

  def start_game
    start_game = StartSequence.new
  end
end

new_game = Battleship.new
