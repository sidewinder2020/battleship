module Messages

  def opening_message
    puts "Welcome to Battleship!/n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts ""
  end

  def comp_places_ships_msg
    puts "Computer ships have been placed./n Please place your first 2-space ship following the pattern: A1 B1 (or your first and second coordinates with a space separating them)."
  end

  def player_prompted_for_3rd_ship_msg
    "Ok, you've placed your first ship, now it's time to place your second.  This one will take up 3 spaces, and requires 3 coordinates.  The coordinates must be:/n
    -next to eachother/n -in a horizontal OR vertical line/n -entered in the order in which they appear on the board/n ex: A1 B1 C1/n  You CANNOT overlap your ships."
  end

  def game_begins_msg
    "You have placed all your ships, and now.../n the game begins."
  end

  def request_fire_coordinates_from_player_msg
    
  end

end
