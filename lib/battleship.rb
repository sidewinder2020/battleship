require 'pry'
require './lib/computer'
require './lib/player'
require './lib/game'

computer = Computer.new
player = Player.new
game = Game.new

puts "                                                       "
puts "-------------------------------------------------------"
puts "                 Welcome to your Doom                  "
puts "-------------------------------------------------------"
puts "                                                       "


puts "I ask you your name so that I may shout it when you are sacrificed to our gods."
name = "bob"
puts "Great, #{name}! Let's get this slaughter started..."



game.start_game



coord_1 = "A1"
puts "Please enter your second coordinate! (capital letter please, followed by the number)"
coord_2 = "A2"
game.player_places_ships(coord_1, coord_2)



puts "Great! Now, please place your third ship, one coordinate at a time.  1st coordinate please:"
coord_1 = "D2"
puts "Second coordinate please:"
coord_2 = "D3"
puts "Almost there, last coordinate please:"
coord_3 = "D4"
game.player_places_second_ship(coord_1, coord_2, coord_3)

game.fire_sequence

game.check_who_won
