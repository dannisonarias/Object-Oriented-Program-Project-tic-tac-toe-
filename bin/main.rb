#!/usr/bin/env ruby

players = []
allowed_moves = (1..9)
pmoves = [[1,5,9,6],[6,4,3]]
wining_moves = [[1,5,9],[7,5,3],[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9]]


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
  

#loop until winning or draw

#looping through each player to get the move
players.each_with_index do |name, index|
  pinput = nil
  
  #loop until correct move
  while pinput.nil?
      puts "#{name}, please enter your move: #{allowed_moves}"
      pinput = gets.chomp.to_i
      if allowed_moves.any? {|move| pinput == move} && !pmoves[index].any?{|oldmove| oldmove == pinput}
        puts "storing : #{pinput}, into array. Index is : #{index}"
          pmoves[index] << pinput 
          puts "stored : pmoves[#{index}]#{pmoves[index]}"
        else 
          puts !pmoves[index].any?{|oldmove| oldmove == pinput} ? "#{name}, enter a valid move" : "#{name}, Move is takened!"
          pinput = nil
      end
#pmoves = [[1,5,9,6],[6,4,3]]
#wining_moves = [[1,5,9],[7,5,3],[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9]]
      pmoves[index].each do |invimove|
         winning_moves.inject do |total,array|
          array.any? { |i| i == invimove }
         end
      end
  end

  #check for a winning player or draw 

end

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
