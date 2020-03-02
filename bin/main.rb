#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting, Layout/LineLength, Metrics/BlockLength

require_relative 'logic.rb'
players = []
allowed_moves = (1..9)
winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]


tictactoe = GameLogic.new()
displaying_board = Display_Board.new(tictactoe.pmoves)

puts 'WELCOME TO TIC TAC TOE'
puts 'Main menu.'
puts '--------------'

puts '1. New game'
puts '2. Game Options'
puts 'Type exit'

input = gets.chomp
exit if input == 'exit'

puts 'Choose your position using the following scheme'
puts '  1 | 2 | 3 '
puts '  4 | 5 | 6 '
puts "  7 | 8 | 9 \n\n\n"

# Loop for playing the game
until %w[exit N n].include? input
  tictactoe.winner = -1

  # getting game player 1 and player 2 names from tictactoe Class. Updating instance variable @players
  tictactoe.GetNames

  # loop until winning or draw
  while tictactoe.winner == -1
    # looping through each player to get the move
    tictactoe.players.each_with_index do |name, index|
      pinput = nil
      # loop until correct move
      while pinput.nil? && tictactoe.winner == -1
        puts "#{name}, #{tictactoe.pmoves[index]} please enter your move: #{allowed_moves}"
        pinput = gets.chomp.to_i
        p "Display_Board , user has selected #{pinput}"
        # check if move valid and if is not warn already taken by any player or invalid move
        if allowed_moves.any? { |move| pinput == move } && tictactoe.pmoves[0].none? { |oldmove| oldmove == pinput } && tictactoe.pmoves[1].none? { |oldmove| oldmove == pinput }
          tictactoe.pmoves[index] << pinput
        else
          if tictactoe.pmoves[0].none? { |oldmove| oldmove == pinput } && tictactoe.pmoves[1].none? { |oldmove| oldmove == pinput }
            puts "#{name}, enter a valid move"
          else
            puts "#{name}, Move is takened!"
          end
          pinput = nil
        end

        tictactoe.CheckWin(index)
        tictactoe.CheckDraw
       
        displaying_board.print_board(tictactoe.pmoves)
      end
    end

  end
  puts tictactoe.winner == -2 ? 'Game is a draw' : "HEY. Congratulations #{tictactoe.players[tictactoe.winner]}, great match!"
  # cleaning board method
  displaying_board.clear_board
  tictactoe.winner = -1
  tictactoe.NewGame
  # <---

  puts 'Game is over'
  puts 'do you want to play again Y/N?'
  input = gets.chomp # exit

end

p 'Thank you for playing'
p 'closing ....'
exit

# rubocop:enable Metrics/BlockNesting, Layout/LineLength, Metrics/BlockLength
