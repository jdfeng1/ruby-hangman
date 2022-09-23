module Dictionary
  
  def select_word
    file = File.open("lib/google-10000-english-no-swears.txt")
    word_list = file.read.split.filter {|string| string.length >= 5 && string.length <= 12}
    file.close
    rand_range = word_list.length - 1

    word_list[rand(0..rand_range)]
  end

end
