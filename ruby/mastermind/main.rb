=begin
    
Build a Mastermind game from the command line where you have 12 turns to guess the secret code, 
starting with you guessing the computer’s random code.

    Think about how you would set this problem up!

    Build the game assuming the computer randomly selects the secret colors and the human player
     must guess them. Remember that you need to give the proper feedback on how good the guess
     was each turn!

    Now refactor your code to allow the human player to choose whether they want to be the 
    creator of the secret code or the guesser.

    Build it out so that the computer will guess if you decide to choose your own secret colors. 

    You may choose to implement a computer strategy that follows the rules of the game or you 
    can modify these rules.

    If you choose to modify the rules, you can provide the computer additional information 
    about each guess. For example, you can start by having the computer guess randomly, 
    but keep the ones that match exactly. You can add a little bit more intelligence to 
    the computer player so that, if the computer has guessed the right color but the wrong 
    position, its next guess will need to include that color somewhere.
    
=end



class Computer

end


class Player
    
    # The code BREAKER will have 12 turns to decipher the code that the MAKER has created.
end


class Board
    
    @@board_design = [[1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234],
                      [1234]]

end

class Code
    # The code consists of 4 digits, each digit ranging from 1-6.
    @@secret_code = []

    def self.choosing_secret_code()
        digit = 0
        puts "Please choose the secret code, it must be 4 digits ranging from 1 to 6"
        puts "please inser the first digit"

        # runs until we have a 4 key code 
        while @@secret_code.size < 4
            puts "please insert a digit, please note that it need to be from 1 to 6" 
            digit = gets.chomp.to_i

            # checks if the user inserted a number in the range of 1 to 6, if he did, add to the array
            if digit > 0 && digit < 7 
                @@secret_code << digit
            else
                puts "the #{digit} is not in the range of 1 to 6"
            end
        end
    end
end



# maybe use a array of numbers for the code

puts "Hello player, welcome to mega mastermind"
puts "Do you want to be the secret code setter, and let the computer discover your code,"
puts "or are you a super human and will discover the secret code set by the computer"
puts "Please just write 'code' for setting the code or 'breaker' for let the computer set the code."
choice = ""
until choice == "code" || choice == "breaker"
    choice = gets.chomp
    if choice == "code"
        # will let player chose the secret code
        Code.choosing_secret_code()
    elsif choice == "breaker"
        puts "You will never find out my secret code ahahahahahaha"
    else
        puts "I do not understand your choice, please insert code to set the code, or breaker to break the code"
    end
end
# You first choose to be either the code MAKER or code BREAKER.

