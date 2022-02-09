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
  @@number = ""

  def self.what_move?(player)
    puts "#{player} what is your move, please choose a number?"
    @@number = gets.to_i
  end


  def self.number_choosing
    @@number
  end

end


Board.print_board()
player1 = Player.new("Pedro")
puts player1.name
puts player1.player_score("Pedro")
puts Play.what_move?(player1.name)

puts player1.symbol
Board.board_update(Play.number_choosing, player1.player_symbol())

Board.print_board()
