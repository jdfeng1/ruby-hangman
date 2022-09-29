require_relative "lib/display.rb"
require_relative "lib/dictionary.rb"
require_relative "lib/saveload.rb"

class Game
  include Hangman
  include Dictionary
  include SaveLoad

  def initialize

    Dir.mkdir('saves') unless Dir.exist?('saves')

    @answer = []
    @progress = []
    @incorrect = 0
    @prev_guesses = []
    @saves = Dir.entries("saves").reject { |f| File.directory?(f) }

    if @saves.empty?
      start_game
    else
      puts "Would you like to load a save? [Y/N]"
      choice = loop do
        currentChoice = gets.chomp.upcase
        break currentChoice if ["Y","N"].include? currentChoice 
        puts "Please select [Y]es or [N]o"
      end
      if choice == "Y"
        load_game
      else
        start_game
      end
    end
  end

  private

  def load_game
    init_load(@saves)
    @answer = @saved_data[:answer]
    @progress = @saved_data[:progress]
    @incorrect = @saved_data[:incorrect]
    @prev_guesses = @saved_data[:prev_guesses]
    game_loop
  end

  def start_game
    @answer = select_word.split("")
    @progress = @answer.map {|x| "_"}
    game_loop
  end

  def game_loop
    while true
      puts "\e[H\e[2J"
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
        puts "Guess a letter: \n(type \"save\" anytime to save your progress)"
        guess = loop do
          currentChoice = gets.chomp
          if currentChoice == "save"
            init_save(@answer, @progress, @incorrect, @prev_guesses)
          elsif @prev_guesses.include?(currentChoice) || @progress.include?(currentChoice)
            puts "You already guessed that letter--pick another!"
          elsif currentChoice.match? /^[a-zA-Z]$/
            break currentChoice
          else
            puts "Please pick a valid single letter"
          end
        end
        if @answer.include? guess
          @answer.each_with_index do |letter, index|
            if letter == guess
              @progress[index] = @answer[index]
            end
          end
        else
          @prev_guesses.push(guess)
          @incorrect += 1
        end
      end
    end
    play_again?
  end

  def play_again?
    puts "Play again? [Y/N]"
    choice = loop do
      currentChoice = gets.chomp.upcase
      break currentChoice if ["Y","N"].include? currentChoice 
      puts "Please select [Y]es or [N]o"
    end
    if choice == "Y"
      initialize
    else
      puts "\nGoodbye!\n"
    end
  end

  
end


Game.new