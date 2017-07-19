require 'pry'
require './lib/computer'
require './lib/player'
require './lib/game'

include messages.rb

class Battleship
attr_accessor :computer, :player, :game

  def initialize
    @computer = Computer.new
    @player = Player.new
    @game = Game.new
  end

  # def begin
  #   game.start_game
  # end
  #
  # def players_ships_are_placed
  #   player_places_ships(coord_1, coord_2)
  #   player_places_second_ship(coord_1, coord_2, coord_3)
  # end

end
