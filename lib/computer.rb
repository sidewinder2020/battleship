require 'pry'


class Computer
attr_accessor :computer_game_board

  def initialize
    @computer_game_board = {"A1" => false, "A2" => false, "A3" => false, "A4" => false,
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

  def first_ship
    board_key_array = []
      @computer_game_board.each_key do |key|
      board_key_array << key
      end
    coord_1 = board_key_array.sample
    coord_2 = second_coord[coord_1].sample
    @computer_game_board[coord_1] = true
    @computer_game_board[coord_2] = true
    return coord_1, coord_2
  end

  def second_ship
    board_key_array = []
    coord_1, coord_2 = first_ship
      @computer_game_board.each do |key|
        if key[1] == false
        board_key_array << key[0]
        end
      end
    ship_2_coord_1 = board_key_array.sample
    @computer_game_board[ship_2_coord_1] = true
    last_2_coords = third_coord[ship_2_coord_1].sample
      while @computer_game_board[last_2_coords[0]] || @computer_game_board[last_2_coords[1]]
        last_2_coords = third_coord[ship_2_coord_1].sample
      end
    @computer_game_board[last_2_coords[0]] = true
    @computer_game_board[last_2_coords[1]] = true
  end

  def shoot(coord)
    if @computer_game_board[coord] == false
      @computer_game_board[coord] = "M"
      puts "Miss!"
    elsif @computer_game_board[coord] == "M"
      puts "You already fired there dumbass"
    elsif !@computer_game_board.include?(coord)
      puts "THAT'S NOT EVEN A COORDINATE!"
    else
      @computer_game_board[coord] = "H"
      puts "Hit!"
    end
  end

  def check_game_board_for_player
    total_hs = @computer_game_board.values.count("H")
    if total_hs == 5
      true
    else
      false
    end
  end

end
