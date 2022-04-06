=begin

When the program first loads, add in an option that allows you to open 
one of your saved games, which should jump you exactly back to where 
you were when you saved. Play on!

=end

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
  return word[rand(0..word.length)]
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

while empty_spaces.include?("_") 

  puts "Please choose a letter and press enter"
  guess = gets.chomp



  Board.update_board(empty_spaces, secret_word, guess)  
  Board.print_board(empty_spaces)

  counter += 1
  if counter == 10
    puts "You LOST"
    break
  end
  
end
# convert secret word to array
puts counter
puts secret_word



# count incorrect guesses they have before the game ends.

# display which correct letters have already been chosen
#and their position in the word, e.g. _ r o g r a _ _ i n g

# which incorrect letters have already been chosen.

###############################################################

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

