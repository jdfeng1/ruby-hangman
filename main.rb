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
    p @answer
    while true
        puts "\r"
        display_progress(@progress)
        display_hangman(@incorrect)
        display_guessed(@prev_guesses)
      if @incorrect == 7
        puts "You lose! The word was #{@answer.join}"
        break
      elsif @progress == @answer
        puts "You guessed the word!"
        break
      else
        puts "Guess a letter:"
        guess = loop do
          currentChoice = gets.chomp
          if @prev_guesses.include?(currentChoice) || @progress.include?(currentChoice)
            puts "You already guessed that letter--pick another!"
          elsif currentChoice.match? /^[a-zA-Z]$/
            break currentChoice
          else
            puts "Please pick a valid single letter"
          end
        end
        puts guess
        if @answer.include? guess
          @answer.each_with_index do |letter, index|
            if letter == guess
              @progress[index] = @answer[index]
            end
          end
        else
          @prev_guesses.push(guess)
          p @prev_guesses
          @incorrect += 1
        end
      end
    end
  end

end


Game.new