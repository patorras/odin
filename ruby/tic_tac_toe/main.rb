# board design
class Board

  # maybe make a board with a array = ["|1|2|3|", "|4|5|6|", "|7|8|9|"]
  # then you access with array[0][0]
    
    # class variable, board
    @@board_toe = ["|1|2|3|", "|4|5|6|", "|7|8|9|"]

    

  def self.print_board()
     
    puts @@board_toe
  end

  ## update board with play
  def self.board_update(number, symbol)
    
    @@board_toe.each do |board|
      # finds the number that the player choose and substitute by his symbol
      board.gsub!(number.to_s, symbol.to_s)
    end
  end

  # checks if board has a winner
  def self.winner?()
    # use a case scenario
    case @@board_toe
      when ["|x|x|x|", "|4|5|6|", "|7|8|9|"]
        true
      when ["|1|2|3|", "|x|x|x|", "|7|8|9|"]
        true
      when ["|1|2|3|", "|4|5|6|", "|x|x|x|"]
        true
      else
        false
    end
  end
end


# Player name, and score
class Player

  attr_accessor :name, :score, :symbol

  def initialize(name)
    @name = name
    @score = score
    @symbol = symbol
  end
  
  # player score
  def player_score(name)
    @score = 0
  end

  # player symbol
  def player_symbol()

    # player choose between o or x as his symbol
    while @symbol != "o" || @symbol != "x"
      puts "Please insert your symbol, you can choose between o or x"
      @symbol = gets.chomp
      if @symbol == "x" || @symbol == "o"
        break
      end
    end
    return @symbol
  end

end


# move, 
class Play
  
  attr_accessor :number
  @@number = 0

  def self.what_move?(player)
    

    while @@number < 1 || @@number > 9
      puts "#{player} what is your move, please choose a number?"
      puts "Please note that you need to choose a number between 1 and 9"
      @@number = gets.to_i
    end
    
  end


  def self.number_choosing
    @@number
  end

end


#############################################################################################
#Creates player 1
puts "Hello, first we will pick the player name and symbol to play"
puts "Please let us know your name:"
player1_name = gets.chomp
player1 = Player.new(player1_name)

# player 1 chooses his symbol
player1_symbol = player1.player_symbol()

# Creates player 2 
puts ""
puts "Please let us know the name of the second player"
player2_name = gets.chomp
player2 = Player.new(player2_name)

# player 2 is assign the other symbol
if player1_symbol == "x"
  player2_symbol = "o"
else
  player2_symbol = "x"
end
puts "Since #{player1_name} choose symbol:#{player1_symbol}, your symbol will be #{player2_symbol}"
puts


# prints the board before the first move
Board.print_board()


# now i need to create a loop asking by turn the plays of each player, 
# after each play check if a player won, by running winner?()

# What is the move of player 1
puts Play.what_move?(player1.name)

# apply player 1 move to the board game
Board.board_update(Play.number_choosing, player1_symbol)
# prints board game
Board.print_board()






# prints the score of the player 1
puts player1.player_score(player1_name)




