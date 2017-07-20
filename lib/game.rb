require 'simplecov'
SimpleCov.start
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
    player_choice =  gets.chomp
    if player_choice == "p"
      comp_places_ships
      puts "                                                                      "
      puts "----------!!!!!!!!! Lllllet's get ready to rumble !!!!!!!!!!----------"
      puts "                                                                      "
      puts "Computer ships have been placed. Please place your first 2-space ship coordinate ( capital letter followed by one number, no spaces ):"
    elsif player_choice == "i"
      instructions
      start_game
    elsif player_choice == "q"
      exit
    else
      puts "Wrong sucka! Try again!"
      start_game
    end
  end

  def comp_places_ships
  computer.second_ship
  end

  def player_places_ships(coord_1, coord_2)
  player.validate_coord_1(coord_1)
  player.validate_coord_2(coord_1, coord_2)
  player_prompted_for_3rd_ship_msg
  end

  def player_places_second_ship(coord_1, coord_2, coord_3)
  player.validate_ship_2_coord_1(coord_1)
  player.validate_ship_2_coord_2(coord_1, coord_2)
  player.validate_ship_2_coord_3(coord_1, coord_2, coord_3)
  game_begins_msg
  end

  def fire_sequence
    until player.check_game_board_for_computer == true || computer.check_game_board_for_player == true
      start = Time.now
      puts "                                  "
      puts "Please enter your shot coordinate."
      puts "                                  "
      coord = gets.chomp
      computer.shoot(coord)
      computer.show_computer_map
      player_needs_to_hit_enter_msg
      enter = gets.chomp
      player.shoot
      player.show_player_map
      player_needs_hit_enter_for_computers_turn_to_end_msg
      enter = gets.chomp
    end
    stop = Time.now
    time = stop - start
    puts time
    check_who_won
  end

  def check_who_won
    if computer.check_game_board_for_player == true
      puts "                                                                               "
      puts "You won! Congratulations, are you proud of yourself? What do ya want, a cookie?"
      puts "                                                                               "
      exit
    else
      puts "                                                "
      puts "FATALITY! Skynet is active, the cake is a lie..."
      puts "                                                "
      exit
    end
  end

end
