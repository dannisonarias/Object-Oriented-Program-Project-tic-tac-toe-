class DisplayBoard
  attr_writer :board

  def initialize(array)
    @array = array
    @board = Array.new(9) { '  ' }
  end

  def print_board(array)
    @array = array
    @array[0].each do |x|
      @board [x - 1] = ' X'
    end
    @array[1].each do |x|
      @board [x - 1] = ' O'
    end
    puts ''
    puts "#{@board[0]}|#{@board[1]}|#{@board[2]}"
    puts "#{@board[3]}|#{@board[4]}|#{@board[5]}"
    puts "#{@board[6]}|#{@board[7]}|#{@board[8]}"
    puts ''
  end

  def clear_board
    @array = [[], []]
    @board = Array.new(9) { '  ' }
  end
end
