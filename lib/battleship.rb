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
player.validate_coord_1(coord_1)
puts "                                                                                    "
puts "Please enter your second coordinate! (ex: C3):"
coord_2 = gets.chomp
player.validate_coord_2(coord_1, coord_2)
player_prompted_for_3rd_ship_msg



puts "One coordinate at a time.  1st coordinate please (ex: D1):"
coord_1 = gets.chomp
player.validate_ship_2_coord_1(coord_1)
puts "                                                          "
puts "Second coordinate please (ex: D2):"
coord_2 = gets.chomp
player.validate_ship_2_coord_2(coord_1, coord_2)
puts "                                                          "
puts "Almost there, last coordinate please (ex:D3):"
coord_3 = gets.chomp
player.validate_ship_2_coord_3(coord_1, coord_2, coord_3)
game_begins_msg

game.fire_sequence
