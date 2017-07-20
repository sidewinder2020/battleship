module Messages

  def opening_message
    puts "                                                                                       "
    puts "Welcome to Battleship!"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit - like a wee, little baby?"
    puts "                                                                                       "
  end

  def instructions
    puts "                                                                                                          "
    puts "----------------------------------------------------------------------------------------------------------"
    puts "Battleship is a time-honored game that you have the privelege to play.  Both you and the computer start off with your own 'boards', both 4x4 grid, on which you will each place a 2-space ship and a 3-space ship. You, the player, will begin, and have the chance to fire one shot by entering one coordinate.  If you hit a ship, on the computer's board, then you will receive an 'H', which denotes a hit.  If you miss, however, you will receive an 'M', for a miss, in that particular spot.  The first individual to sink both of their opponent's ships, is victorious! DO NOT enter the same coordinate twice, DO NOT try to break me, DO NOT commit bestiality.  That will be all."
    puts "AND REMEMBER! If, at any point in time, you do not like where this game is going...tough luck."
    puts "...or press control C..."
    puts "----------------------------------------------------------------------------------------------------------"
    puts "                                                                                                          "
  end

  def player_prompted_for_3rd_ship_msg
    puts "                                                             "
    puts "Ok, you've placed your first ship, now it's time to place your second.  This one will take up 3 spaces, and requires 3 coordinates.  The coordinates must be:"
    puts "                                                             "
    puts "- next to eachother"
    puts "- in a horizontal OR vertical line"
    puts "- entered in the order in which they appear on the board"
    puts "- ONE AT A TIME, then press enter to enter the next coordinate"
    puts "- You CANNOT overlap your ships."
    puts "                                                             "
  end

  def game_begins_msg
    puts "                                                            "
    puts "You have placed all your ships, and now... THE GAME BEGINS!."
    puts "                                                            "
  end

  def player_needs_to_hit_enter_msg
    puts "Please hit enter to continue, and for the computer's turn to begin."
    puts "                                                                   "
  end

  def player_needs_hit_enter_for_computers_turn_to_end_msg
    puts "Please hit enter to continue onto your next turn..."
    puts "                                                   "
  end

end
