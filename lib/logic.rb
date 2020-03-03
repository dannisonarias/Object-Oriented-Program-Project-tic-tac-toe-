class GameLogic
  attr_accessor :winner, :players, :pmoves

  def initialize()
    @players = []
    @winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
    @allowed_moves = (1..9)
    @pmoves = [[], []]
    @winner = -1
    @wins = false
  end

  def names_empty?
    return @players[0].nil? || @players[1].nil?
  end

  def new_game
    @players = [nil, nil]
    @pmoves = [[], []]
    @winner = -1
  end

  def exit_messages
    case @winner
    when -2
      return'Game is a draw'
    when -3
      return 'User Exit'
    else
      return "HEY. Congratulations #{@players[@winner]}, great match!"
    end
  end

  def check_win(index)
    @winning_moves.each do |array|
      @wins = true if (array - @pmoves[index]).empty?
      @winner = index if @wins
    end
  end

  def check_draw
    @winner = -2 if @pmoves[0].length + @pmoves[1].length == 9
    @wins = false
  end

  def store_move(index)
    @pmoves[index] << @pinput
  end

  def allowed_move?(input, name)
    @pinput = input
    if @allowed_moves.any? { |move| @pinput == move }
      true
    else
      puts "#{name}, enter a valid move"
      false
    end
  end

  def not_occupied_move?(input, name)
    @pinput = input
    if @pmoves[0].none? { |oldmove| oldmove == @pinput } && @pmoves[1].none? { |oldmove| oldmove == @pinput }
      true
    else
      puts "#{name}, Move is takened!"
    end
  end
end
