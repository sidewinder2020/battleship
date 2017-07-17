require 'pry'
require './lib/computer'
require './lib/player'

class Game
attr_accessor :computer, :player

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def shoot(coord)
    if coord == false
      puts "miss!"
    else
      puts "hit!"
      coord = false
  end

end
