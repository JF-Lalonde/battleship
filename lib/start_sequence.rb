class StartSequence
  attr_reader :player_input
  
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
    valid = false
    while valid != true
      choice = gets.chomp
      if choice == "p" || choice == "play"
        play
        valid = true
      elsif choice == "i" || choice == "instructions"
        instructions
        print ">"
      elsif choice == "q" || choice == "quit"
        abort("End of BATTLESHIP game.")
        valid = true
      else
        print "Wrong Input! \n>"
      end
    end
  end

  def play
    p "Let's start!"
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
