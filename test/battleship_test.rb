require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/battleship'

class BattleshipTest < Minitest::Test

  def setup
    @battleship = Battleship.new
  end

end
