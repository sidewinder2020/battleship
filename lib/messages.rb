module Messages

  def opening_message
    puts "Welcome to Battleship!/n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "Battleship is a time-honored game that you have the privelege to play.  Both you and the computer start off with your own 'boards', of a 4x4 grid, on which you will each place a 2-space ship and a 3-space ship.  Then the game will begin.  You will begin, and have the chance to fire one shot by entering one coordinate.  If you hit a ship, on the computer's board, then you will receive an 'H', which denotes a hit.  If you miss, however, you will receive an 'M', for a miss, in that particular spot.  DO NOT enter the same coordinates, DO NOT try to break me, DO NOT commit bestiality.  That will be all."
  end

  def comp_places_ships_msg
    puts "                                                                                 "
    puts "Computer ships have been placed. Please place your first 2-space ship coordinate:"
    puts "                                                                                 "
  end

  def player_prompted_for_3rd_ship_msg
    puts "    "
    puts "Ok, you've placed your first ship, now it's time to place your second.  This one will take up 3 spaces, and requires 3 coordinates.  The coordinates must be:"
    puts "-next to eachother"
    puts "-in a horizontal OR vertical line"
    puts "-entered in the order in which they appear on the board"
    puts "-ONE AT A TIME, then press enter to enter the next coordinate"
    puts "-You CANNOT overlap your ships."
    puts "     "
  end

  def game_begins_msg
    puts "                                                            "
    puts "You have placed all your ships, and now... THE GAME BEGINS!."
    puts "                                                            "
  end

  def player_needs_to_hit_enter_msg
    puts "                                                                   "
    puts "Please hit enter to continue, and for the computer's turn to begin."
    puts "                                                                   "
  end

end
