require 'pry'

class Player
attr_accessor :player_game_board

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

  def validate_coord_1(coord_1)
    if @player_game_board.keys.include?(coord_1)
      player_game_board[coord_1] = true
    else
      puts "Pick a place on the board, buttmunch"
    end
  end

  def validate_coord_2(coord_1, coord_2)
    if !@player_game_board.keys.include?(coord_2) || coord_1 == coord_2 || second_coord[coord_1].none? { |coord| coord == coord_2 }
        puts "That is not a valid coordinate"
    else
      player_game_board[coord_2] = true
    end
  end

  def validate_ship_2_coord_1(coord_1)
    if !@player_game_board.include?(coord_1) || @player_game_board[coord_1] == true
        puts "Try again, land-lubber!"
    else
      @player_game_board[coord_1] = true
    end
  end

  def validate_ship_2_coord_2(coord_1, coord_2)
    if !@player_game_board.include?(coord_2) || coord_1 == coord_2 || second_coord[coord_1].none? { |coord| coord == coord_2 } || @player_game_board[coord_2] == true
        puts "That is not a valid coordinate"
    else
      @player_game_board[coord_2] = true
    end
  end

  def validate_ship_2_coord_3(coord_1, coord_2, coord_3)
    if !@player_game_board.include?(coord_3) || coord_1 == coord_3 || coord_2 == coord_3 || @player_game_board[coord_3] == true
      puts "not a valid coord"
    else
      @player_game_board[coord_3] = true
    end
  end

  def shoot
    board_key_array = []
      @player_game_board.each_key do |key|
      board_key_array << key
      end
      coord = board_key_array.sample
    if @player_game_board[coord] == false
      @player_game_board[coord] = "M"
      puts "Miss!"
    elsif @player_game_board[coord] == "M"
      puts "You already fired there dumbass"
    elsif !@player_game_board.include?(coord)
      puts "THAT'S NOT EVEN A COORDINATE!"
    else
      @player_game_board[coord] = "H"
      puts "Hit!"
    end
  end

  def check_game_board_for_computer
    total_hs = @player_game_board.values.count("H")
    if total_hs == 5
      true
    else
      false
    end
  end

  def show_player_map
    if @player_game_board.values == false
         p 💧
    elsif @player_game_board.values == true
         p 💧
    elsif @player_game_board.values == "H"
         p 💢
    elsif @player_game_board.values == "M"
         p 😭
    end
    top           =  "-------------------"
    columns        = [".", "  1  ", "  2  ", "  3  ", "  4  "].join
    a_row         = ["A", @player_game_board["A1"], @player_game_board["A2"], @player_game_board["A3"], @player_game_board["A4"]].join
    b_row         = ["B", @player_game_board["B1"], @player_game_board["B2"], @player_game_board["B3"], @player_game_board["B4"]].join
    c_row         = ["C", @player_game_board["C1"], @player_game_board["C2"], @player_game_board["C3"], @player_game_board["C4"]].join
    d_row         = ["D", @player_game_board["D1"], @player_game_board["D2"], @player_game_board["D3"], @player_game_board["D4"]].join
    bottom        = "--------------------"
    print "\n#{top}\n#{columns}\n#{a_row}\n#{b_row}\n#{c_row}\n#{d_row}\n#{bottom}\n\n"
  end
end
