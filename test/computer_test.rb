require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/computer'

class ComputerTest < Minitest::Test

  def setup
    @computer = Computer.new
  end

  def test_grid_exists
    assert_instance_of Hash, @computer.computer_game_board
  end

end
