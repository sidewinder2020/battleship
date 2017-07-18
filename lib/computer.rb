class Computer
attr_reader

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
  { "A1"=>[["A2","A3"],["B1","C1"]],                "A2"=>[["A1","A3"],["B2","C2"]],
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
    @player_game_board.each_key do |key|
      board_key_array << key
    end
    coord_1 = board_key_array.sample
    coord_2 = second_coord[coord_1].sample
    @player_game_board[coord_1] = true
    @player_game_board[coord_2] = true
    return coord_1, coord_2
  end

  def second_ship
    board_key_array = []
    coord_1, coord_2 = first_ship
    @player_game_board.each_key do |key|
      if key == false
        board_key_array << key
      end
    end
    ship_2_coord_1 = board_key_array.sample
    @player_game_board[ship_2_coord_1] = true
    last_2_coords = third_coord[ship_2_coord_1].sample unless @player_game_board[last_2_coords[0]] == false || @player_game_board[last_2_coords[1]] == false
    @player_game_board[last_2_coords[0]] = true
    @player_game_board[last_2_coords[1]] = true
  end
  # only call second_ship within game file, it will also place first ship

  def shoot(coord)
    if coord == false
      coord = "M"
      puts "miss!"
    else
      coord = "H"
      puts "hit!"
  end

  def check_game_board_for_player
    # (need a passive method to check if all of the squares are holding a value of false - if so, then game over) - this method will be used IMMEDIATELY AFTER the player fires, and again after the computer fires.
    if @player_game_board.values.none? do |value|
      value == true
      puts "The game is over! Skynet has conquered, the cake is a lie."
      exit
    else
      #do nothing
    end

end
