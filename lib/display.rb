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

     puts hangman[incorrect - 1]
  end

  def display_progress(progress)
    progress.each {|x| print x + " "}
    puts "\n"
  end
end
