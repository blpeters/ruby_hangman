# frozen_string_literal: true

require_relative "display"
require_relative "game_files"
require 'yaml'

# Game logic for Hangman word game
class Hangman

  include Display
  include GameFiles

  attr_accessor :correct_letters, :wrong_letters, :word_clues, :guesses_left, :guess, :answer

  def initialize
    @guess = ''
    game_mode = prompt_for_load 
    until ['1','2'].include?(game_mode)
      puts "Invalid choice"
      game_mode = prompt_for_load 
    end
    game_mode == '1' ? new_game : load_game
  end

  def new_game
    display_instructions
    @answer = random_word.split('')
    @word_clues = new_word_board(answer)
    @correct_letters = []
    @wrong_letters = []
    @guesses_left = 10
    play_game
  end

  def play_game
    display_clues(word_clues)
    until game_over?
      get_guess
      check_guess(guess)
      give_feedback
    end
    play_again_prompt
  end

  def get_guess
    prompt_for_letter
    @guess = gets.chomp.upcase
    get_guess until validate_guess(@guess)
  end

  def validate_guess(guess)
    if guess == 'SAVE' || guess == 'EXIT'
      save_or_exit
    elsif letter_used?(guess)
      display_letter_used
      false
    elsif !is_letter?(guess)
      display_invalid_input
      false
    else true
    end
  end

  def letter_used?(guess)
    if correct_letters.include?(guess) || wrong_letters.include?(guess)
      true
    else false
    end
  end

  def is_letter?(guess)
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

  def game_over?
    false
    if guesses_left == 0
      display_lose_game
      puts answer.join('').upcase
      true
    elsif solved?
      display_win_game
      puts answer.join('').upcase
      true
    end
  end

  private

 # Selects a random 5 to 12 letter word from word bank.
  def random_word 
    word_bank_raw = File.open("google-10000-english-no-swears.txt").readlines.each(&:chomp!)
    word_bank =  word_bank_raw.select {|element| element.length >= 5 && element.length <= 12}
    word_bank[rand(word_bank.length)].upcase
  end

  def new_word_board(word)
    board = Array.new(word.length, '_')
  end
end

game = Hangman.new
