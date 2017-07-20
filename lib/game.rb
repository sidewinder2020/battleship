require 'pry'
require './lib/computer'
require './lib/player'
require './lib/messages'

include Messages

class Game
attr_accessor :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start_game
    opening_message
    player_choice =  "p"
    if player_choice == "p"
      puts "Lllllet's get ready to rumble!"
      comp_places_ships
    elsif player_choice == "i"
      instructions
    elsif player_choice == "q"
      exit
    else
      puts "Wrong sucka! Try again!"
    end
  end

  def comp_places_ships
  # computer places ships, validates both
  # notifies player that computer ships have been placed, prompts player for coords for 2-space ship
  computer.second_ship
  comp_places_ships_msg
  end

  def player_places_ships(coord_1, coord_2)
  # coords for 2-space ship are entered and validated
  # prompts player for coords for 3-space ship
  player.validate_coord_1(coord_1)
  player.validate_coord_2(coord_1, coord_2)
  player_prompted_for_3rd_ship_msg
  end

  def player_places_second_ship(coord_1, coord_2, coord_3)
  # coords for 3-space ship are entered and validated
  player.validate_ship_2_coord_1(coord_1)
  player.validate_ship_2_coord_2(coord_1, coord_2)
  player.validate_ship_2_coord_3(coord_1, coord_2, coord_3)
  game_begins_msg
  end

  def fire_sequence
    until player.check_game_board_for_computer == true || computer.check_game_board_for_player == true
      puts "                                  "
      puts "Please enter your shot coordinate."
      puts "                                  "
      coord = gets.chomp
      computer.shoot(coord)
      # computer.show_computer_map
      player.shoot
      # player.show_player_map
      player_needs_to_hit_enter_msg
      enter = gets.chomp
    end
  end

  def check_who_won
    if computer.check_game_board_for_player == true
      puts "                                                                               "
      puts "You won! Congratulations, are you proud of yourself? What do ya want, a cookie?"
      puts "                                                                               "
    else
      puts "                                                "
      puts "FATALITY! Skynet is active, the cake is a lie..."
      puts "                                                "
    end
  end

end
