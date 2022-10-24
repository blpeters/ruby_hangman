# frozen_string_literal: true

module Display
  def display_instructions
    puts "Welcome to Hangman!"
    puts "You will have 10 incorrect guesses to solve the secret word"
    puts "Let's Play!\n"
  end

  def display_clues(clues)
    puts " "
    puts clues.join(' ')
    puts " "
  end

  def prompt_for_letter
    print "Please guess a letter: "
  end
  
  def display_letter_used
    print "This letter has already been guessed - Please select a different letter: "
  end

  def display_invalid_input
    print "This is not a valid input. Please enter a single alphabetical letter that has not yet been used: "
  end

  def display_lose_game
    puts "You ran out of turns - GAME OVER.\n\n"
    puts "The word was...\n\n"
  end

  def display_win_game
    puts "You solved the word! YOU WIN!\n\n"
    puts "The word was...\n\n"
  end
end