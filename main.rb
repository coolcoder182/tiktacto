require_relative "Game"
puts "please enter p1 name"
p1 = gets.chomp
puts "please enter p2 name"
p2 = gets.chomp
game = Game.new(p1, p2)

game.play
