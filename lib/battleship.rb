require 'pry'
require './lib/computer'
require './lib/player'
require './lib/game'

class Battleship
attr_accessor :computer, :player, :game

  def initialize
    @computer = Computer.new
    @player = Player.new
    @game = Game.new
  end

end
