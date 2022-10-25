# frozen_string_literal: true

# Command line display methods for Hangman game.
module GameFiles
  def save_or_exit
    case guess
    when 'SAVE'
      save_game
    when 'EXIT'
      puts "\nExiting Game - Thanks for playing\n\n"
      exit
    end
  end

  def save_game
    print "\nPlease enter a file name for your game: "
    filename = gets.chomp
    File.open("./output/#{filename}.yml", 'w') {|file| YAML.dump([] << self, file)}
    puts "\nFile saved as #{filename}.yml \n\n"
    "Exiting Program..."
    exit
  end

  def load_game
    saved_games = Dir.children('output')
    saved_games.each_with_index {|file, index| puts "\n#{index + 1} - #{file}"}
    puts "\nPlease select from the saved files above by entering the corresponding number: "
    selection = gets.chomp
    until selection.match?(/\d/) && saved_games.at(selection.to_i - 1) != nil
      puts "\nInvalid Input. Select a file number from the above list: "
      selection = gets.chomp
    end
    deserialize(saved_games[selection.to_i - 1])
  end

  def deserialize(filename)
    yaml = YAML.load_file("./output/#{filename}", permitted_classes: [Hangman])
    self.answer = yaml[0].answer
    self.word_clues = yaml[0].word_clues
    self.correct_letters = yaml[0].correct_letters
    self.wrong_letters = yaml[0].wrong_letters
    self.guesses_left = yaml[0].guesses_left
    give_feedback
    play_game
  end
end
