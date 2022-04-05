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

secret_word = new_secret_word()

# create the empty spaces for the letters and 
empty_spaces = Array.new(secret_word.length, "_")

# prints it
empty_spaces.each {|space| print space}
puts "\n"



# convert secret word to array
secret_word_array = secret_word.chars
puts secret_word_array

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

