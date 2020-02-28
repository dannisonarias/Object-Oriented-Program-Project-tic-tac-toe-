#!/usr/bin/env ruby

players = []
allowed_moves = (1..9)
pmoves = [[],[]]
winning_moves = [[1,5,9],[7,5,3],[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9]]


puts 'Main menu.'
puts '--------------'

puts '1. New game'
puts '2. Game Options'
puts 'Type exit'

input = gets.chomp
exit if input == 'exit'

while players[0].nil? || players[1].nil?
  puts 'Player 1. Enter your name'
  players[0] = gets.chomp
  puts 'Player 2. Enter your name'
  players[1] = gets.chomp
end

# Loop for playing the game
until %w[exit N n].include? input
winner = -1
total_matches = 0

  #loop until winning or draw
  while winner == -1 

    #looping through each player to get the move
    players.each_with_index do |name, index|
      pinput = nil
      
      #loop until correct move
      while pinput.nil? && winner == -1
        puts "#{name}, #{pmoves[index]} please enter your move: #{allowed_moves}"
        pinput = gets.chomp.to_i
        # if below check if move valid and if is not already taken by any player
        if allowed_moves.any? {|move| pinput == move} && !pmoves[0].any?{|oldmove| oldmove == pinput} && !pmoves[1].any?{|oldmove| oldmove == pinput}
          puts "storing : #{pinput}, into array. Index is : #{index}"
          pmoves[index] << pinput 
          puts "stored : pmoves[#{index}]#{pmoves[index]}"
        else 
          puts !pmoves[0].any?{|oldmove| oldmove == pinput} && !pmoves[1].any?{|oldmove| oldmove == pinput} ? "#{name}, enter a valid move" : "#{name}, Move is takened!"
          pinput = nil
        end

          #pmoves = [[1,5,9,6],[6,4,3]]
              #winning_moves = [[1,5,9],[7,5,3],[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9]]
        winning_moves.each do |win_array|                 #check each array in wining_moves
          total_matches = win_array.map do |win_move|                 
            pmoves[index].any?{|player_move| player_move == win_move} ? 1 : 0
              #puts "win_array is : #{win_array}, checking now move #{player_move} against #{win_move}: iqual? : #{player_move == win_move}
          end
          puts "#{players[index]}, player. Moves so far: #{pmoves[index]}"
          puts "total winning moves in sequences #{win_array} is : #{total_matches.inject(:+)} "
          winner = index if total_matches.inject(:+) == 3
        end
      end
    end 
  end

puts "HEY. Congratulations #{players[winner]}, great match #{pmoves[winner]}"

puts "#{players[0]} selected : #{pmoves[0][0]}, #{players[1]} selected : #{pmoves[1][0]}, "

  puts '1. Enter your move'

  puts '2. Exit game'

  input = gets.chomp

  puts "Your move is #{input}"
  puts '<method that display current board>'

  puts "\n\n\n <example>"
  puts '  0 |   |  '
  puts '    | X |  '
  puts "    |   | X \n\n\n"

  puts 'game is over'
  puts 'do you want to play again Y/N?'
  input = gets.chomp # exit
  p "good choice #{input}"
end

p 'Thank you for playing'
p 'closing ....'
exit
