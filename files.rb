# frozen_string_literal: true

require_relative "hangman"

module Files

  # Prompt for loading an existing game file or starting a new game.
  # If loading file, display names of files available
  # f = File.open('name.txt', 'w,r, or ??') - create and open new file in wwhat mode
  # f.puts "contents"
  # f.close
  #
  # when saving, check if a file already exists with File.exists? 'filename.txt'
  # if user inputs "save", ask them for a name for the file, check if file exists, write current_game object (with YAML or JSON) to a file with that name.

end