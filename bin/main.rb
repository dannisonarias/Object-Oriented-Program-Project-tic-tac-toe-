#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting

require_relative '../lib/logic.rb'
require_relative '../lib/display.rb'
tictactoe = GameLogic.new
displaying_board = DisplayBoard.new(tictactoe.pmoves)

puts 'WELCOME TO TIC TAC TOE'
puts 'Main menu.'
puts '--------------'
puts '1. New game'
puts '2. Game Options'
puts 'Type exit to leave game'

input = gets.chomp
exit if input == 'exit'

puts 'Choose your position using the following scheme'
puts '  1 | 2 | 3 '
puts '  4 | 5 | 6 '
puts "  7 | 8 | 9 \n\n\n"

until %w[exit N n].include? input
  tictactoe.winner = -1

  tictactoe.your_name

  while tictactoe.winner == -1
    tictactoe.players.each_with_index do |name, index|
      pinput = nil
      while pinput.nil? && tictactoe.winner == -1
        puts "#{name}, #{tictactoe.pmoves[index]} please enter your move: "
        pinput = gets.chomp

        if pinput != 'exit'

          pinput = pinput.to_i
          if tictactoe.allowed_move?(pinput, name) && tictactoe.not_occupied_move?(pinput, name)
            tictactoe.store_move(index)
          else
            pinput = nil
          end

          tictactoe.check_win(index)
          tictactoe.check_draw
          displaying_board.print_board(tictactoe.pmoves)
        end
        tictactoe.winner = -3 if pinput == 'exit'
      end
    end

  end

  tictactoe.exit_messages

  displaying_board.clear_board
  tictactoe.winner = -1
  tictactoe.new_game

  puts 'Game is over'
  puts 'do you want to play again Y/N?'
  input = gets.chomp # exit

end

p 'Thank you for playing'
p 'closing ....'
exit

# rubocop:enable Metrics/BlockNesting
