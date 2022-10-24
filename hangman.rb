# frozen_string_literal: true

require_relative "display"

# Game logic for Hangman word game
class Hangman

  include Display

  attr_accessor :guesses_left, :guess

  def initialize
    @answer = random_word.split('')
    p answer
    @word_clues = new_word_board(answer)
    @correct_letters = []
    @wrong_letters = []
    @guess = ''
    @guesses_left = 10
    play_game
  end

  def play_game
    display_instructions
    display_clues(word_clues)
    until game_over?
      get_guess
      check_guess(guess)
      give_feedback
    end
  end

  def get_guess
    prompt_for_letter
    @guess = gets.chomp
    get_guess until validate_guess(@guess)
  end

  def validate_guess(guess)
    if letter_used?(guess)
      display_letter_used
      false
    elsif !is_letter?(guess)
      display_invalid_input
      false
    else
      true
    end
  end

  def letter_used?(guess)
    if correct_letters.include?(guess) || wrong_letters.include?(guess)
      true
    else false
    end
  end
 
  def is_letter?(guess)
    p guess
    guess.match?(/[a-zA-Z]/) && guess.length == 1
  end

  def check_guess(guess)
    if answer.include?(guess)
      add_letter(guess)
    else 
      wrong_letters.push(guess).sort!
      @guesses_left = @guesses_left - 1
    end
  end

  def solved?
    answer == word_clues
  end

  def add_letter(guess)
    answer.each_with_index { |char, index| 
      if char == guess
        word_clues[index] = "#{char}"
      end
    }
    correct_letters.push(guess).sort!
  end

  def give_feedback
    puts "\n\n"
    puts "Wrong Letters guessed: #{wrong_letters}"
    puts "Correct Letters guessed: #{correct_letters}"
    puts "INCORRECT GUESSES REMAINING: #{guesses_left}"
    display_clues(word_clues)
  end

  def game_over?
    if guesses_left == 0
      display_lose_game
      puts answer.join('').upcase
      true
    elsif solved?
      display_win_game
      puts answer.join('').upcase
      true
    else false
    end
  end

  private

  attr_reader :answer
  attr_accessor :correct_letters, :wrong_letters, :word_clues

 # Selects a random 5 to 12 letter word from word bank.
  def random_word 
    word_bank_raw = File.open("google-10000-english-no-swears.txt").readlines.each(&:chomp!)
    word_bank =  word_bank_raw.select {|element| element.length >= 5 && element.length <= 12}
    word_bank[rand(word_bank.length)]
  end

  def new_word_board(word)
    board = Array.new(word.length, '_')
    p board
  end
end

Hangman.new

