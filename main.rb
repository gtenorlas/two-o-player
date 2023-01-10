require "./game.rb"
require "./player.rb"

def main()

  players=[]
  for a in 1..2 do
    puts "Please enter Player #{a}'s name"
    name = gets.chomp
    player = Player.new(name,3)
    players << player
  end

  game = Game.new(players,3)

  while !game.check_winner
    game.new_question
    game.validate
    game.show_score
    game.turn_index = game.turn_index == 0 ? 1 : 0
  end
end

main