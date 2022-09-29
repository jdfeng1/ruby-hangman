require "yaml"

module SaveLoad
  def init_save(answer, progress, incorrect, prev_guesses)
    @save_hash = {
      answer: answer,
      progress: progress,
      incorrect: incorrect,
      prev_guesses: prev_guesses
    }

    puts "Name your save:"
    file_name = gets.chomp

    file = "saves/#{file_name}.yaml"
    if File.exists?(file)
      puts "Overwrite existing save with same name? [Y/N]"
      choice = loop do
        currentChoice = gets.chomp.upcase
        break currentChoice if ["Y","N"].include? currentChoice 
        puts "Please select [Y]es or [N]o"
      end
      if choice == "Y"
        save(file)
      else
        init_save(answer, progress, incorrect, prev_guesses)
      end
    else
      save(file)
    end
  end

  def save(file)
    File.open(file, 'w') do |f|
      f.write YAML.dump(@save_hash)
    end
    puts "Saved!"
  end

  def init_load(saves)
    puts "\nSave list:"
    puts saves
    puts "\n"
    load_check
  end

  def load_check
    puts "Which save would you like to load? (no file extension)"
    load_name = gets.chomp
    begin
      @saved_data = YAML.load(File.read("saves/#{load_name}.yaml"))
    rescue
      puts "Invalid save name!"
      load_check
    end
  end
end
