#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting, Layout/LineLength, Metrics/BlockLength

require_relative 'logic.rb'
tictactoe = GameLogic.new()
displaying_board = Display_Board.new(tictactoe.pmoves)

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

# Loop for playing the game untill the user decides to 'exit'
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
        puts "#{name}, #{tictactoe.pmoves[index]} please enter your move: #{}"
        pinput = gets.chomp
       
        #check if player has decided to 'exit'
        if pinput != 'exit'

          # check if the players move is valid or position is takened
          pinput = pinput.to_i
          if tictactoe.AllowedMove?(pinput,name) && tictactoe.NotOcuppiedMove?(pinput,name)
            tictactoe.StoreMove(index)
          else
            pinput = nil
          end
          # check if the players move is valid or position is takened
          
          tictactoe.CheckWin(index)
          tictactoe.CheckDraw    
          displaying_board.print_board(tictactoe.pmoves)
        end
        #check if player has decided to 'exit'
        tictactoe.winner = -3 if pinput == 'exit'
      end
    end

  end

  # exit_messages , displaying if game was a draw, a win, or user exited

  tictactoe.exit_messages
  
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
