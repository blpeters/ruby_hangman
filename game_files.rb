# frozen_string_literal: true

# Command line display methods for Hangman game.
module GameFiles
  def save_or_exit
    case guess
    when 'SAVE'
      save_game
    when 'EXIT'
      puts 'Exiting Game - Thanks for playing'
      exit
    end
  end

  def save_game
    print 'Please enter a file name for your game: '
    filename = gets.chomp
    File.open("./output/#{filename}.yml", 'w') {|file| YAML.dump([] << self, file)}
    puts "File saved as #{filename}.yaml"
    exit
  end

  def load_game
    # Show files in output directory
    deserialize("brett.yaml")
  end

  def deserialize(file_name)
    yaml = YAML.load_file("./output/brett.yml", permitted_classes: [Hangman])
    p yaml
    self.answer = yaml[0].answer
    self.word_clues = yaml[0].word_clues
    self.correct_letters = yaml[0].correct_letters
    self.wrong_letters = yaml[0].wrong_letters
    self.guesses_left = yaml[0].guesses_left
    play_game
  end
end
