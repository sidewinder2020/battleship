require 'pry'
require './lib/computer'
require './lib/player'

include messages.rb

class Game
attr_accessor :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start_game
    opening_message
    player_choice = gets.chomp
    if player_choice == "p"
      #next method
    elsif player_choice == "i"
      instructions
    elsif player_choice == "q"
      exit
    else
      "Wrong sucka! Try again!"
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

  # game begins

  def player_fire_sequence(coord)
  # display map, from player's point of view, and prompt player for position on which to fire
  request_fire_coordinate_from_player_msg
  coord = gets.chomp
  computer.shoot(coord)
  computer.check_game_board_for_player
  end

  def show_map_to_player_after_player_shot
    # indicate hit or miss - show updated map [hit becomes 'H', miss becomes 'M']
    player_needs_to_hit_enter_msg
    enter = gets.chomp
  end

  def computer_fire_sequence(coord)
  # computer fires @ random
    player.shoot(coord)
    player.check_game_board_for_computer
  end

  def show_map_to_player_after_computer_shot
    #show map to player after computer shot
  end

end
