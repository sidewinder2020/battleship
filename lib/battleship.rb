require 'simplecov'
SimpleCov.start
require 'pry'
require './lib/computer'
require './lib/player'
require './lib/game'

computer = Computer.new
player = Player.new
game = Game.new


puts "                                                       "
puts "-------------------------------------------------------"
puts "|                Welcome to your Doom                 |"
puts "-------------------------------------------------------"
puts "                                                       "


puts "I ask you your name so that I may shout it when you are sacrificed to our gods."
name = gets.chomp
puts "Great, #{name}! Let's get this slaughter started..."



game.start_game



coord_1 = gets.chomp
puts "                                                                                    "
puts "Please enter your second coordinate! ( capital letter again please, followed by the number, no spaces, no diagonals )"
coord_2 = gets.chomp
game.player_places_ships(coord_1, coord_2)



puts "One coordinate at a time.  1st coordinate please:"
coord_1 = gets.chomp
puts "                         "
puts "Second coordinate please:"
coord_2 = gets.chomp
puts "                                     "
puts "Almost there, last coordinate please:"
coord_3 = gets.chomp
game.player_places_second_ship(coord_1, coord_2, coord_3)

game.fire_sequence
