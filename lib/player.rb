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
      coord_1 = gets.chomp
      validate_coord_1(coord_1)
    end
  end

  def validate_coord_2(coord_1, coord_2)
    if !@player_game_board.keys.include?(coord_2) || coord_1 == coord_2 || second_coord[coord_1].none? { |coord| coord == coord_2 }
        @player_game_board[coord_1] = false
        puts "That is not a valid coordinate"
        puts "Please enter the first coordinate again"
        coord_1 = gets.chomp
        validate_coord_1(coord_1)
        puts "Now the second coordinate!"
        coord_2 = gets.chomp
        validate_coord_2(coord_1, coord_2)
    else
      player_game_board[coord_2] = true
    end
  end

  def validate_ship_2_coord_1(coord_1)
    if !@player_game_board.include?(coord_1) || @player_game_board[coord_1] == true
        puts "Try again, land-lubber!"
        coord_1 = gets.chomp
        validate_ship_2_coord_1(coord_1)
    else
      @player_game_board[coord_1] = true
    end
  end

  def validate_ship_2_coord_2(coord_1, coord_2)
    if !@player_game_board.include?(coord_2) || coord_1 == coord_2 || second_coord[coord_1].none? { |coord| coord == coord_2 } || @player_game_board[coord_2] == true
        @player_game_board[coord_1] = false
        puts "That is not a valid coordinate"
        puts "Please enter the first coordinate again."
        coord_1 = gets.chomp
        validate_ship_2_coord_1(coord_1)
        puts "The second coordinate, again please..."
        coord_2 = gets.chomp
        validate_ship_2_coord_2(coord_1, coord_2)
    else
      @player_game_board[coord_2] = true
    end
  end

  def validate_ship_2_coord_3(coord_1, coord_2, coord_3)
    if !@player_game_board.include?(coord_3) || coord_1 == coord_3 || coord_2 == coord_3 || @player_game_board[coord_3] == true
      @player_game_board[coord_1] = false
      @player_game_board[coord_2] = false
      puts "NOT A VALID COORDINATE"
      puts "Please enter the first coordinate again."
      coord_1 = gets.chomp
      validate_ship_2_coord_1(coord_1)
      puts "The second coordinate (sigh), again please..."
      coord_2 = gets.chomp
      validate_ship_2_coord_2(coord_1, coord_2)
      puts "And the final coordinate, one last time."
      coord_3 = gets.chomp
      validate_ship_2_coord_3(coord_1, coord_2, coord_3)
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
      puts "I thought computers were supposed to be intelligent...you already fired there dumbass!"
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

  def game_placer(position)
    if    @player_game_board[position] == false
      "💧"
    elsif @player_game_board[position] == true
      "⚜️"
    elsif @player_game_board[position] == "H"
      "💢"
    elsif @player_game_board[position] == "M"
      "😭"
    end
  end

  def show_player_map
    top         =  "-------------------"
    columns     = ["🛳", "  1  ", "  2  ", "  3  ", "  4  "].join
    a_row       = ["A", "  " + game_placer("A1") + "  ", "  " + game_placer("A2") + "  ", "  " + game_placer("A3") + "  ", "  " + game_placer("A4") + "  "].join
    b_row       = ["B", "  " + game_placer("B1") + "  ", "  " + game_placer("B2") + "  ", "  " + game_placer("B3") + "  ", "  " + game_placer("B4") + "  "].join
    c_row       = ["C", "  " + game_placer("C1") + "  ", "  " + game_placer("C2") + "  ", "  " + game_placer("C3") + "  ", "  " + game_placer("C4") + "  "].join
    d_row       = ["D", "  " + game_placer("D1") + "  ", "  " + game_placer("D2") + "  ", "  " + game_placer("D3") + "  ", "  " + game_placer("D4") + "  "].join
    bottom      = "--------------------"
    print "\n#{top}\n#{columns}\n#{a_row}\n#{b_row}\n#{c_row}\n#{d_row}\n#{bottom}\n\n"
  end
end
