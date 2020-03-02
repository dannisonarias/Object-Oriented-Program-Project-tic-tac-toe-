class GameLogic
    attr_accessor :winner, :players, :pmoves

    def initialize()
        @players = []
        @winning_moves = winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
        @allowed_moves = (1..9)
        @pmoves = [[], []]
        @winner = -1
        @wins = false
    end

    def CheckWin(index)
        @winning_moves.each do |array|
        @wins = true if (array - @pmoves[index]).empty?
        # reset winner so that we can exit the while loop ->
        @winner = index if @wins
        end
    end

    def CheckDraw
        @winner = -2 if @pmoves[0].length + @pmoves[1].length == 9
        @wins = false
    end

    def GetNames
      while @players[0].nil? || @players[1].nil?
        puts 'Player 1. Enter your name'
        @players[0] = gets.chomp
        puts 'Player 2. Enter your name'
        @players[1] = gets.chomp
      end
      true
    end

    def NewGame
      @players = [nil, nil]
      @pmoves = [[], []]
      @winner = -1
    end

end

class Display_Board
    attr_writer :board

    def initialize(array)
      @array = array
      @board = Array.new(9) {'  '}
    end

    def print_board
    # code that sets the board -->
      @array[0].each do |x|
        @board [x - 1] = ' X'
      end
      @array[1].each do |x|
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

    def clear_board
      @pmoves = [[], []]
      @board = Array.new(9) {'  '}
    end
  end


