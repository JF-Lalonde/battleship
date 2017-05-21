# Start sequence creates a screen with three options:
#p, i, q and their corresponding outputs
class StartSequence
  def initialize
    @start_screen = start_screen
  end

  def start_screen
    print "Welcome to BATTLESHIP\n\n"
    print "Would you like to (p)lay, read the "
    print "(i)nstructions, or (q)uit?\n>"
  end
end

new_game = StartSequence.new
