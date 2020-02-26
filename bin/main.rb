#!/usr/bin/env ruby
puts 'Main menu.'
puts '--------------'

puts '1. New game'
puts '2. Game Options'
puts 'Type exit'

input = gets.chomp
exit if input == 'exit'

# Loop for playing the game
until %w[exit N n].include? input
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
