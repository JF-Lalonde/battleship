# Start sequence creates a screen with three options:
#p, i, q and their corresponding outputs
class StartSequence
  def initialize
    @start_screen = start_screen
    @player_input = player_input
  end

  def start_screen
    print "Welcome to BATTLESHIP\n\n"
    print "Would you like to (p)lay, read the "
    print "(i)nstructions, or (q)uit?\n>"
  end

  def player_input
    choice = gets.chomp
    if choice == "p"
      play
    elsif choice == "i"
      instructions
    elsif choice == "q"
      abort("End of BATTLESHIP game.")
    else
      puts "Wrong Input!"
    end
  end

  def play
    puts "Let's start!"
    computer_player = ComputerPlayer.new
  end

  def instructions
    puts "Begin by setting up your ships' starting and ending coordinates.
    Your ships must be in a straight line vertically or horizontally across
    the board. Example: 'A3 A5' for a 3-unit ship.
    Take turns firing upon the enemy ships by typing out coordinates.
    Example: 'A3'. Your shot will be marked as a hit (X) or a miss (M) on
    your enemy map.
    When your enemy fires upon you, the you'll see the coordinates they chose
    and whether it was a hit or a miss. You will also see your player map with
    all previous firing attempts.
    A ship is sunk when all of its units have been hit. The player who sinks all
    of their opponent's ships first wins.
    "
  end
end
new_game = StartSequence.new
