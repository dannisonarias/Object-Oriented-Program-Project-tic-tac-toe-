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

  def exit_messages
    case @winner
    when -2
      puts 'Game is a draw'
    when -3
      puts 'User Exit'
    else
      puts "HEY. Congratulations #{@players[@winner]}, great match!"
    end
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

  def StoreMove(index)
    @pmoves[index] << @pinput
  end

  def AllowedMove?(input, name)
    @pinput = input
    if @allowed_moves.any? { |move| @pinput == move }
      true
    else
      puts "#{name}, enter a valid move"
      false
    end
  end

  def NotOcuppiedMove?(input, name)
    @pinput = input
    if @pmoves[0].none? { |oldmove| oldmove == @pinput } && @pmoves[1].none? { |oldmove| oldmove == @pinput }
      true
    else
      puts "#{name}, Move is takened!"
    end
  end
end
