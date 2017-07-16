require 'pry'

class Player
attr_reader :player_game_board

  def initialize
    @player_game_board = {"A1" => false, "A2" => false, "A3" => false, "A4" => false,
    "B1" => false, "B2" => false, "B3" => false, "B4" => false,
    "C1" => false, "C2" => false, "C3" => false, "C4" => false,
    "D1" => false, "D2" => false, "D3" => false, "D4" => false}
  end

  def second_coord
   {"A1"=>["A2","B1"], "A2"=>["A1","A3","B2"], "A3"=>["A2","A4","B3"], "A4"=>["B4","A3"],
    "B1"=>["B2","A1","C1"], "B2"=>["B1","B3","A2","C2"], "B3"=>["A3","B2","B4","C3"], "B4"=>["A4","B3","C4"],
    "C1"=>["B1","C2","D1"], "C2"=>["C1","C3","B2","D2"], "C3"=>["B3","C2","C4","D3"], "C4"=>["B4","C3","D4"],
    "D1"=>["C1","D2"], "D2"=>["D1","D3","C2"], "D3"=>["C3","D2","D4"], "D4"=>["C4","D3"]}
  end

  def third_coord
  { "A1"=>[["A2","A3"],["B1","C1"]], "A2"=>[["A1","A3"],["B2","C2"]],
    "A3"=>[["A2","A4"],["B3","C3"]], "A4"=>[["A2","A3"],["B4","C4"]],
    "B1"=>[["A1","C1"],["B2","B3"]], "B2"=>[["B1","B3"],["A2","C2"]],
    "B3"=>[["B2","B4"],["A3","C3"]], "B4"=>[["B2","B3"],["A4","C4"]],
    "C1"=>[["B1","D1"],["C2","C3"]], "C2"=>[["B2","D2"],["C1","C3"]],
    "C3"=>[["B3","D3"],["C2","C4"]], "C4"=>[["B4","D4"],["C2","C3"]],
    "D1"=>[["B1","C1"],["D2","D3"]], "D2"=>[["D1","D3"],["B2","C2"]],
    "D3"=>[["D2","D4"],["C3","B3"]], "D4"=>[["B4","C4"],["D2","D3"]]}
  end

  def place_ship(coord_1, coord_2)
    player_game_board[coord_1] = true
    player_game_board[coord_2] = true
  end

  def validate_coord_1(coord_1)
    if @player_game_board.include?(player_game_board[coord_1])
      player_game_board[coord_1] = true
    else
      false
      puts "Pick a place on the board, buttmunch"
    end
  end

  def validate_coord_2(coord_1, coord_2)
    if !@player_game_board.include?[coord_2] || @player_game_board[coord_1] == @player_game_board[coord_2] || second_coord[coord_1].none? { |coord| coord == coord_2 }
      return
        puts "That is not a valid coordinate"
    else
      player_game_board[coord_2] = true
    end
  end

  def validate_ship_2_coord_1(coord_1)
    if !@player_game_board.include?[coord_1] || @player_game_board[coord_1] == true
      return
        puts "Try again, land-lubber!"
    else
      @player_game_board[coord_1] = true
    end
  end

  def validate_ship_2_coord_2(coord_1, coord_2)
    if !@player_game_board.include?[coord_2] || @player_game_board[coord_1] == @player_game_board[coord_2] || second_coord[coord_1].none? { |coord| coord == coord_2 } || @player_game_board[coord_2] == true
      return
        puts "That is not a valid coordinate"
    else
      @player_game_board[coord_2] = true
  end

  def validate_ship_2_coord_3(coord_1, coord_2, coord_3)

    else
      @player_game_board[coord_3] = true
    end
  end

end
