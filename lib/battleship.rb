require './lib/start_sequence'
require './lib/player'
require './lib/game_map'

class Battleship
  attr_reader :start_game,
              :y_axis

  def initialize
    @start_sequence = StartSequence.new
  end

  def start_game
    @start = Time.now
    start_player
    start_ai
    deploy_comp_ships(@computer, @computer.first)
    deploy_comp_ships(@computer, @computer.second)
    display_message
    deploy_player_ship(@player, @player.first)
    deploy_player_ship(@player, @player.second)
    play_rounds
  end

  def start_player
    @player = Player.new("Player")
  end

  def start_ai
    @y_axis = ["A", "B", "C", "D"]
    @x_axis = ["1", "2", "3", "4"]
    @computer = Player.new("Computer")
    @random_shots = []
    @y_axis.each do |y|
      @x_axis.each do |x|
        @random_shots << [y,x]
      end
    end
    @random_shots.shuffle!
  end

  def display_message
    puts "          I have laid out my ships on the grid.
          You now need to layout your two ships.
          The first is two units long and the
          second is three units long.
          The grid has A1 at the top left and D4 at the bottom right.\n"
  end

  def deploy_player_ship(player, ship)
    valid = false
    while valid != true
      coordinate = {}
      puts "Enter the start and end coordinates for the #{ship.type} ship: "
      input = gets.chomp.upcase
      if valid !=true && input.length == 5
        if input.split[0][0] == input.split[1][0]
          orientation = :horizontal
          if (ship.ship_length - 1) != (input.split[1][1].to_i - input.split[0][1].to_i)
            puts "Invalid Dimensions!\n"
          else
            valid = true
          end
        elsif input.split[0][1] == input.split[1][1]
          orientation = :vertical
          if (ship.ship_length - 1) != (input.split[1][0].ord - input.split[0][0].ord)
            puts "Invalid Dimensions!\n"
          else
            valid = true
          end
        else
          puts "Invalid Orientation!\n"
        end
      end
    end
      valid = false
      if valid != true && input.length == 5
        coordinate[:row] = @y_axis.index(input.split[0][0])
        coordinate[:column] = @x_axis.index(input.split[0][1])
        coordinate_y_2 = @y_axis.index(input.split[1][0])
        coordinate_x_2 = @x_axis.index(input.split[1][1])
        if !coordinate[:row].nil? && !coordinate[:column].nil? &&
           !coordinate_y_2.nil? && !coordinate_x_2.nil?
          valid = true
        else
          puts "Invalid Coordinates!\n"
        end
        valid = false
        if @player.game_map.check_clearance?(ship.type, coordinate, orientation) &&
           @player.game_map.ship_within_map?(ship.type, coordinate, orientation)
           ship.place_ship(player.game_map, coordinate, orientation)
           valid = true
        else
           puts "Invalid ship placement!\n"
        end
      end
  end

  def deploy_comp_ships(player, ship)
    coordinate = {}
      valid = false
      while valid != true
        orientation = [:vertical, :horizontal].sample
        if orientation == :vertical
          rows = @y_axis[0..-1 - ship.ship_length]
          columns = @x_axis
        else
          rows = @y_axis
          columns = @x_axis[0..-1 - ship.ship_length]
        end

        coordinate[:row] = @y_axis.index(rows.sample)
        coordinate[:column] = @x_axis.index(columns.sample)

        if @computer.game_map.check_clearance?(ship.type, coordinate, orientation) &&
          @computer.game_map.ship_within_map?(ship.type, coordinate, orientation)
          valid = true
          if ship.type == :first
            @computer.first.place_ship(player.game_map, coordinate, orientation)
          elsif ship.type == :second
            @computer.second.place_ship(player.game_map, coordinate, orientation)
          end
        end
      end
  end

  def play_rounds
    game_over = false
    player_shots = 0
    computer_shots = 0
    while game_over == false
      @player.print_boards
      player_round
      player_shots += 1
      if @computer.ships_left == 0
        winner = "Congrats! It took you #{player_shots} shots"
        game_over = true
      end
      computer_round
      computer_shots +=1
      if @player.ships_left == 0
        winner = "Oh no! It took #{computer_shots} shots for Computer"
        game_over = true
      end
    end
    finish = Time.now
    diff = finish - @start
    puts "#{winner} to win!"
    puts "Game took #{diff} seconds to complete."
  end

  def player_round
    target = {}
    valid = false
    while valid != true
      print "\n Your turn. Target coordinates: "
      input = gets.chomp.upcase
      target[:row] = @y_axis.index(input.split[0][0])
      target[:column] = @x_axis.index(input.split[0][1])
      if target[:row].nil? || target[:column].nil?
        puts "Invalid target!\n"
      elsif @player.target_board.grid[target[:row]][target[:column]].hitbox != :empty
        puts "You already shot there!"
      else
        valid = true
      end
    end

    if @computer.game_map.grid[target[:row]][target[:column]].hitbox == :empty
      puts "\n Miss!\n"
      @player.target_board.grid[target[:row]][target[:column]].miss
    else
      puts "\n Hit!\n"
      @player.target_board.grid[target[:row]][target[:column]].hit
      if @computer.game_map.grid[target[:row]][target[:column]].hitbox == :first
        @computer.first.hit
        if @computer.first.sunk?
          @computer.ships_left -= 1
          puts "You've sunk the computer's first ship, of two-unit size \n"
        end
      elsif @computer.game_map.grid[target[:row]][target[:column]].hitbox == :second
        @computer.second.hit
        if @computer.second.sunk?
          @computer.ships_left -= 1
          puts "You've sunk the computer's second ship, of three-unit size \n"
        end
      end
    end
  end

  def computer_round
    p "Computer's turn..."
    target_coords = @random_shots.pop
    target = {}
    target[:row] = @y_axis.index(target_coords[0])
    target[:column] = @x_axis.index(target_coords[1])
    print "Computer fired at #{target_coords[0]}#{target_coords[1]}\n"
    if @player.game_map.grid[target[:row]][target[:column]].hitbox == :empty
      @player.game_map.grid[target[:row]][target[:column]].miss
      puts "Miss!\n"
    else
      puts "Hit!\n"
      if @player.game_map.grid[target[:row]][target[:column]].hitbox == :first
        @player.game_map.grid[target[:row]][target[:column]].hit
        @player.first.hit
        if @player.first.sunk?
          @player.ships_left -= 1
          puts "First ship has been sunk!\n"
        else
          puts "First ship has been hit!\n"
        end
      elsif @player.game_map.grid[target[:row]][target[:column]].hitbox == :second
        @player.game_map.grid[target[:row]][target[:column]].hit
        @player.second.hit
        if @player.second.sunk?
          @player.ships_left -= 1
          puts "Second ship has been sunk!\n"
        else
          puts "Second ship has been hit!\n"
        end
      end
    end
    puts "End of Computer's turn.....\n"
  end
end

new_game = Battleship.new
new_game.start_game
