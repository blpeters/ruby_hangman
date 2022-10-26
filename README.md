# Ruby Hangman

This is my version of the classic 2-player word game, Hangman, using only a command line interface. Built using Ruby.

## [Live Demo](https://replit.com/@blpeters/rubyhangman#main.rb)

### Skills 

 - Input Validation
 - File serialization and deserialization
 - YAML
 - Save states

### Future Improvements

  - Build out some graphical interface with an actual hangman character displayed to the command line.
  - Add colors/styling to the text to make items stand out. For example, red for wrong answers/letters, green for correct, blue for instructions, etc.
  - Revisit code at a later time to refactor. I don't have many classes, and my objects started to bleed into each other as I got close to the end of version 1. For example, the Display class probably has too much extraneous logic.
  - Refactor to tuck the answer variable away in a private location in the class.