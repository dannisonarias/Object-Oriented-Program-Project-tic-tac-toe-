class DisplayBoard
  attr_writer :board

  def initialize(array)
    @array = array
    @board = Array.new(9) { '  ' }
  end

  def print_board(array)
    @matrix = ''
    @array = array
    @array[0].each do |x|
      @board [x - 1] = ' X'
    end
    @array[1].each do |x|
      @board [x - 1] = ' O'
    end
    @matrix += "\n"
    @matrix += "#{@board[0]}|#{@board[1]}|#{@board[2]}\n"
    @matrix += "#{@board[3]}|#{@board[4]}|#{@board[5]}\n"
    @matrix += "#{@board[6]}|#{@board[7]}|#{@board[8]}\n"
    @matrix += "\n"
    @matrix
  end

  def clear_board
    @array = [[], []]
    @board = Array.new(9) { '  ' }
  end
end
