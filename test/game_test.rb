require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end
