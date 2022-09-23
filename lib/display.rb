module Hangman
  def display_hangman(incorrect)
    hangman = ["
      ____
     |/   |
     |   
     |    
     |    
     |    
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |    
     |    
     |    
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |    |
     |    |    
     |    
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |   \\|
     |    |
     |    
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |   \\|/
     |    |
     |    
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |   \\|/
     |    |
     |   / 
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |   \\|/
     |    |
     |   / \\
     |
     |_____
     ",
     "
      ____
     |/   |
     |   (_)
     |   /|\\
     |    |
     |   | |
     |
     |_____
     "]

     puts hangman[incorrect]
  end

  def display_progress(progress)
    progress.each {|x| print x.upcase + " "}
    puts "\n"
  end

  def display_guessed(prev_guesses)
    print "Already Guessed: "
    prev_guesses.each {|x| print x.upcase + " "}
    puts "\n"
  end
end
