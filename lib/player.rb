require 'pry'

class Player
attr_reader :player_game_board

  def initialize
    @player_game_board = {"A1" => false, "A2" => false, "A3" => false, "A4" => false,
    "B1" => false, "B2" => false, "B3" => false, "B4" => false,
    "C1" => false, "C2" => false, "C3" => false, "C4" => false,
    "D1" => false, "D2" => false, "D3" => false, "D4" => false}
  end

  def place_ship(coord_1, coord_2)
    player_game_board[coord_1] = true
    player_game_board[coord_2] = true
  end

  def

end
