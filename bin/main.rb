#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting, Layout/LineLength, Metrics/BlockLength

require_relative 'logic.rb'
#require 'GameLogic'
#require 'TttDisplay'
players = []
allowed_moves = (1..9)
pmoves = [[], []]
winning_moves = [[1, 5, 9], [7, 5, 3], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
board = array = Array.new(9) {'  '}
tictactoe = GameLogic.new()
displaying_board = Display_Board.new(pmoves,board)

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
  winner = -1

  # getting game player 1 and player 2 names. Updating instance variable @players
  tictactoe.GetNames

  # loop until winning or draw
  while winner == -1
    # looping through each player to get the move
    tictactoe.players.each_with_index do |name, index|
      pinput = nil
      # loop until correct move
      while pinput.nil? && winner == -1
        puts "#{name}, #{pmoves[index]} please enter your move: #{allowed_moves}"
        pinput = gets.chomp.to_i
        p "Display_Board , user has selected #{pinput}"
        # check if move valid and if is not warn already taken by any player or invalid move
        if allowed_moves.any? { |move| pinput == move } && pmoves[0].none? { |oldmove| oldmove == pinput } && pmoves[1].none? { |oldmove| oldmove == pinput }
          pmoves[index] << pinput
        else
          if pmoves[0].none? { |oldmove| oldmove == pinput } && pmoves[1].none? { |oldmove| oldmove == pinput }
            puts "#{name}, enter a valid move"
          else
            puts "#{name}, Move is takened!"
          end
          pinput = nil
        end
        # checking if players moves has a winning combination --->
        wins = false
        winning_moves.each do |array|
          wins = true if (array - pmoves[index]).empty?
          # reset winner so that we can exit the while loop ->
          winner = index if wins
          #<-

          #Checking for a draw game -->
          winner = -2 if pmoves[0].length + pmoves[1].length == 9
          #<---
          wins = false
        end


        displaying_board.print_board
      end
    end

  end
  puts winner == -2 ? 'Game is a draw' : "HEY. Congratulations #{players[winner]}, great match!"
  # cleaning board method
  pmoves = [[], []]
  board = array = Array.new(9) {'  '}
  winner = -1
  players = [nil, nil]
  # <---

  puts 'Game is over'
  puts 'do you want to play again Y/N?'
  input = gets.chomp # exit
end

p 'Thank you for playing'
p 'closing ....'
exit

# rubocop:enable Metrics/BlockNesting, Layout/LineLength, Metrics/BlockLength
