require_relative "lib/display.rb"
require_relative "lib/dictionary.rb"

class Game
  include Hangman
  include Dictionary

  def initialize
    @answer = []
    @progress = []
    @incorrect = 0
    @prev_guesses = []
    start_game
  end

  def start_game
    @answer = select_word.split("")
    @progress = @answer.map {|x| "_"}
    game_loop
  end

  def game_loop
    display_progress(@progress)
  end

end


newGame = Game.new