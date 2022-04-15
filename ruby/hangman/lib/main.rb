=begin

When the program first loads, add in an option that allows you to open 
one of your saved games, which should jump you exactly back to where 
you were when you saved. Play on!

=end



require "json"
require "yaml"


#################################################################
class Game_session
  attr_accessor :secret_word, :board, :tries

  def initialize(secret_word, board, tries)
    @secret_word = secret_word
    @board = board
    @tries = tries
  end

  def save_to_json()
    hash = {}
    hash[:secret_word] = @secret_word
    hash[:board] = @board
    hash[:tries] = @tries

    return hash.to_json
  end

  def self.load_json_file()
    file = File.open("sample.json", "r")
    data = JSON.load(file)
    @tries = data["tries"]
    p @tries = data
  end




end
#################################################################

#################################################################
def new_secret_word()

  # load in the dictionary
  contents = File.open("google-10000-english-no-swears.txt", "r")

  word = []

  contents.each do |row|
     if row.length > 5 && row.length < 12
      word << row
     end
    
  end

  # randomly select a word 
  return word[rand(0..word.length)].delete_suffix("\n")
end
#################################################################

class Board

  def self.create_empty_board(word)
    empty_spaces = Array.new((word.length-1), "_")
    return empty_spaces
  end

  def self.print_board(board)
    board.each {|space| print space}
    puts "\n"
  end

  def self.update_board(board, word, guess)
    
    word.chars.each_with_index do |char, index|
      if char == guess
        board[index] = char
      end
    end
    
    return board
  end

  

end


secret_word = new_secret_word()

# create the empty spaces for the letters and 
empty_spaces = Board.create_empty_board(secret_word)


# prints board
Board.print_board(empty_spaces)




counter = 0
correct_letters = []
incorrect_letters = []


while empty_spaces.include?("_") 

  puts "Please choose a letter and press enter, if you want to save the game do it by typing save"
  guess = gets.chomp.downcase

  # saves game
  if guess == "save"
    game_session = Game_session.new(secret_word, empty_spaces, counter)

    fname = "sample.json"
    some_file = File.open(fname, "w")
    game = game_session.save_to_json
    some_file.puts game
    some_file.close
  end

  if secret_word.include?(guess)
    correct_letters << guess
  elsif guess == "save"
    puts "Game was save"
    next
  elsif guess == "load"
    Game_session.load_json_file()
  else
    incorrect_letters << guess
    counter += 1
    puts "You have more #{10 - counter} tries"
  end





  puts "Correct letters choosen: "
  correct_letters.each {|letter| print letter}
  puts "\n"

  puts "Incorrect letters choosen: "
  incorrect_letters.each {|letter| print letter}
  puts "\n"

  Board.update_board(empty_spaces, secret_word, guess)  
  Board.print_board(empty_spaces)

  puts "#############################################################"



  if counter == 10
    puts "You LOST the correct word was #{secret_word}"
    break
  end
  
end



# prints a winning message
empty_spaces = empty_spaces.join()
if empty_spaces == secret_word
  puts "Congratulations you won!! The word was indeed #{secret_word}"
end












# turn function

=begin
Every turn

player to make a guess of a letter

case insensitive

Update the display 

if out of guesses, {
the player should lose.
}

if the letter was correct{
  show their position in the word
  display which correct letters have already been chosen;
}
else if 
  update incorrect letters have already been chosen

=end
###############################################################

# save function
=begin
start of any turn, instead of making a guess

the player should  have the option to save the game

serialize your game class too!
=end

