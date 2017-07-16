require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new
  end

  def test_grid_exists
    assert_instance_of Hash, @player.player_game_board
  end

  def test_it_turns_to_true
    @player.place_ship("A1", "A2")
    assert @player.player_game_board["A1"]
    assert @player.player_game_board["A2"]
  end

  def test_it_



end
