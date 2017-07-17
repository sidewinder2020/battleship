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

  def shoot(coord)
    if coord == false
      puts "miss!"
    else
      puts "hit!"
      coord = false
  end

end
