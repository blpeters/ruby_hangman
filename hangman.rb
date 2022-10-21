# frozen_string_literal: true

# Game logic for Hangman word game
class Hangman

  attr_accessor :guesses_left

  def initialize
    @answer = random_word
    @word_clues = new_word_board(answer)
    @correct_letters = []
    @wrong_letters = []
    @guesses_left = 10
    play_game
  end

  def play_game
    puts "These will be the instructions"
    #prompt for letter - will need the answer, the word display, arrays for correctly and incorrectly guessed letters
    until game_over
      guess = validate_guess(get_guess)
      check_guess(guess)
      p guesses_left
    end
  end

  def get_guess
    print "this will display the guess prompt. enter letter: "
    gets.chomp
  end

  def validate_guess(guess)
    # TODO - Validate that a single alpha character entered that hasnt been guessed yet.
    guess
  end

  def check_guess(guess)
    answer_arr = answer.split('')
    if answer_arr.include?(guess)
      answer_arr.each_with_index { |char, index| 
        if char == guess
          word_clues[index] = " #{char} "
        end
      }
    else 
      wrong_answers << guess
    end
  end

  def word_solved?
    false
  end

  def game_over
    if guesses_left == 0 or word_solved?
      true
    else false
    end
  end

  private

  attr_reader :answer
  attr_accessor :correct_letters, :wrong_letters, :word_clues

 # Select a random 5 to 12 letter word from word bank.
  def random_word 
    word_bank_raw = File.open("google-10000-english-no-swears.txt").readlines.each(&:chomp!)
    word_bank =  word_bank_raw.select {|element| element.length >= 5 && element.length <= 12}
    @answer = word_bank[rand(word_bank.length)]
    p @answer
  end

  def new_word_board(word)
    Array.new(word.length, ' _ ').join('')
  end
end

Hangman.new

# Create a secret word display with same number of blanks as the answer

# Prompt the user to guess a single letter, while displaying how many guesses they have left.

# Check letter against answer (with index) and add that letter at the same index to the word display array if matches

# Add valid guess to a letters guessed array

# Display new secret word display with letters added, updated guesses left, and letters already guessed.

# For subsequent guesses, check letter guess against letters_guessed array and reprompt if letter already used

# Game over if guesses == 0 or the word display no longer contains any blanks.
