# frozen_string_literal: true

module Display
  def display_instructions
    puts ''
    puts '~~~~~~~~~~~~~~~~~~~~'
    puts "Welcome to Hangman!"
    puts '~~~~~~~~~~~~~~~~~~~~'
    puts ''
    puts "You will have 10 incorrect guesses to solve the secret word"
    puts "Let's Play!\n"
  end

  def prompt_for_load
    print "\nPlease enter 1 for new game or 2 to load an existing game: "
    gets.chomp
  end

  def display_clues(clues)
    puts " "
    puts "SECRET WORD: #{clues.join(' ')}"
    puts " "
  end

  def give_feedback
    puts "\n\n"
    puts "Wrong Letters guessed: #{wrong_letters}"
    puts "Correct Letters guessed: #{correct_letters}"
    puts "INCORRECT GUESSES REMAINING: #{guesses_left}"
    display_clues(word_clues)
  end

  def prompt_for_letter
    print "Please guess a letter, enter 'save' to save game, or 'exit' to quit: "
  end
  
  def display_letter_used
    print "This letter has already been guessed - Please select a different letter: "
  end

  def display_invalid_input
    print "This is not a valid input. "
  end

  def display_lose_game
    puts "You ran out of turns - GAME OVER.\n\n"
    puts "The word was...\n\n"
  end

  def display_win_game
    puts "You solved the word! YOU WIN!\n\n"
    print "The word was... "
  end

  def play_again_prompt
    puts "\nWould you like to play again? (y/n): "
    validate_choice(choice = gets.chomp.upcase)
    case choice
    when "Y" || "YES"
      new_game
    when "N" || "NO"
      puts "\nThanks for playing!"
      exit
    end
  end

  def validate_choice(choice)
    until ['Y', 'YES', 'N', 'NO'].include?(choice)
      puts "\nInvalid choice. Select YES (Y) or NO (N): "
      choice = gets.chomp.upcase
    end
  end
end