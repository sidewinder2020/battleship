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
  validate_coord_1(coord_1)
  validate_coord_2(coord_1, coord_2)
  player_prompted_for_3rd_ship_msg
  end

  def player_places_second_ship
  # coords for 3-space ship are entered and validated
  validate_ship_2_coord_1(coord_1)
  validate_ship_2_coord_2(coord_1, coord_2)
  validate_ship_2_coord_3(coord_1, coord_2, coord_3)
  game_begins_msg
  end

  # game begins

  def player_fire_sequence
  # display map, from player's point of view, and prompt player for position on which to fire
  request_fire_coordinates_from_player_msg
  end

  # indicate hit or miss - show updated map [hit becomes 'H', miss becomes 'M']

  # prompt player to hit enter

  # computer fires @ random

  # display player's map with H or M, where the computer fired

  # (need a passive method to check if all of the squares are holding a value of false - if so, then game over) - this method will be used IMMEDIATELY AFTER the player fires, and again after the computer fires.

  # (need a passive method to iterate through an array of the ship's coords and check if any are true) - if there are any true values, do nothing, if there aren't, put 2 - space ship is sunk

  # (do the previous method)

  def shoot(coord)
    if coord == false
      puts "miss!"
    else
      puts "hit!"
      coord = false
  end

end
