class GameLogic
    attr_writer :pmoves
    attr_accessor :winner, :players

    def initialize()
        @players = []
        @winning_moves = winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
        @allowed_moves = (1..9)
        @pmoves = [[], []]
        @winner = -1
    end

=begin     def CheckWinner(index)
    wins = false
    @winning_moves.each do |array|
      wins = true if (array - @pmoves[index]).empty?
      @winner = index if wins
      @winner = -2 if @pmoves[0].length + @pmoves[1].length == 9
      wins = false
    end 
=end

    def GetNames
      while @players[0].nil? || @players[1].nil?
        puts 'Player 1. Enter your name'
        @players[0] = gets.chomp
        puts 'Player 2. Enter your name'
        @players[1] = gets.chomp
      end
      true
    end

end

class Display_Board

    def initialize(pmoves,board)
      @pmoves = pmoves
      @board = board
    end

    def print_board
 # code that sets the board -->
  @pmoves[0].each do |x|
    @board [x - 1] = ' X'
  end
  @pmoves[1].each do |x|
    @board [x - 1] = ' O'
  end
  #<----

  # DISPLAY THE BOARD --->
  puts ''
  puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
  puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
  puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
  puts ''
  # DISPLAY THE BOARD <-----
    end
  end

=begin 
    def BoardDisplay
      puts ''
      puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
      puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
      puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
      puts ''
    end

    def BoardDisplay_hash

      puts ''
      puts "#{@board_hash[:0]}|#{@board_hash[:1]}|#{@board_hash[:2]}"
      puts "#{@board_hash[:3]}|#{@board_hash[:4]}|#{@board_hash[:5]}"
      puts "#{@board_hash[:6]}|#{@board_hash[:7]}|#{@board_hash[:8]}"
      puts ''
    end 
=end