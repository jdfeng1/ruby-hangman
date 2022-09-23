require_relative "lib/hangman.rb"
require_relative "lib/dictionary.rb"

class Game
  include Hangman
  include Dictionary
  
end