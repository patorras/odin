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

    def self.code_creation()
        # just creates the random code if the computer is the code setter
        random_array = Array.new(4) {rand 1..6}
        return random_array
    end


    def self.play(player_secret_code)

        # i want to check if i can create random numbers, and start to elimenate the options i dont want

        # variable to keep the correct numbers in the correct position
        correct_guess = [nil, nil, nil, nil]
        computer_guess = [1,1,1,1]

        for x in 0..11 do 

            for i in 0..3 do
                # this would simple check if one of my guesses is in the code, do not provide feedback on position
                if player_secret_code.include?(computer_guess[i])
                    
                    # would compare if the position and number is correct
                    if player_secret_code[i] == computer_guess[i] 
                        puts "#{computer_guess} #{computer_guess[i]} exists in the code and is in the correct position" 
                        correct_guess[i] = computer_guess[i]

                    # check if the number exists in the wrong position 
                    else
                        puts "#{computer_guess} #{computer_guess[i]} exists in the code but is NOT in the correct position"
                        
                        computer_guess[i] = computer_guess[i] + 1 
                    
                        
                    end
                else
                    puts "#{computer_guess} #{computer_guess[i]} does not exist in the code"
                    ########### here i need to eliminate the options that do not exist from the rand
                    computer_guess[i] = computer_guess[i] + 1
                end
            end

            if correct_guess.include?(nil) == false
                puts "You suck the computer guessed your code, it was #{correct_guess}"
            end
        end

        puts correct_guess
        puts computer_guess
    
    end

end


class Player
    
    # The code BREAKER will have 12 turns to decipher the code that the MAKER has created.

    # is my guess == to computer code?

    # if yes, i won

    # elsif let give clues

   

    

    def self.play(random_computer_array, my_guess)

        for i in 0..3 do
            # this would simple check if one of my guesses is in the code, do not provide feedback on position
            if random_computer_array.include?(my_guess[i])
                
                # would compare if the position and number if correct
                if random_computer_array[i] == my_guess[i] 
                    puts "#{my_guess} #{my_guess[i]} exists in the code and is in the correct position" 
                
                # check if the number exists in the wrong position 
                else
                    puts "#{my_guess} #{my_guess[i]} exists in the code but is NOT in the correct position"
                end
            else
            puts "#{my_guess} #{my_guess[i]} does not exist in the code"
            end
        end

    
    end

end




class Code
    # The code consists of 4 digits, each digit ranging from 1-6.
    @@secret_code = []

    def self.choosing_secret_code()
        digit = 0
        puts "Please choose the secret code, it must be 4 digits ranging from 1 to 6"
        puts "please inser the first digit"

        # runs until we have a 4 digit key code 
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
        return @@secret_code
    end

    # method to give a guess, should return a array
    def self.guessing_code()
        guess_array = []

        while guess_array.size < 4
            puts "Please enter a digit for your guess"
            guess_array << gets.chomp.to_i
        end
        return guess_array
    end


    def self.winner_check(code_setter, code_breaker)
        if code_setter == code_breaker
            puts "#{code_setter} is equal to #{code_breaker}"
            return "Winner"
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
        player_code = Code.choosing_secret_code()

        

        Computer.play(player_code)

    elsif choice == "breaker"
        puts "You will never find out my secret code ahahahahahaha"
        computer_secret_code = Computer.code_creation()

        for i in 0..12
            player_guess_code = Code.guessing_code()
            Player.play(computer_secret_code, player_guess_code)
        
            if computer_secret_code == player_guess_code
                puts "You have won the secret code was #{computer_secret_code}"
                break
            end
        end
    else
        puts "I do not understand your choice, please insert code to set the code, or breaker to break the code"
    end
end
# You first choose to be either the code MAKER or code BREAKER.



# now i need to loop the code above, for 12 plays.