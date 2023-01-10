# require "./player.rb"
require "./player.rb"
class Game
  attr_accessor :players, :number_of_lives, :turn_index

  def initialize(players,number_of_lives)
    @players = players
    @number_of_lives = number_of_lives
    @turn_index = 0
    @answer = nil 
    @question_response = nil
  end

  def random_number(min,max)
    rand(min..max)
  end

  def new_question()
    puts "-------- NEW TURN -----------"
    first_number = random_number(1, 20)
    second_number = random_number(1, 20)
    @answer = first_number + second_number
    puts "#{@players[@turn_index].name}: What does #{first_number} plus #{second_number} equal?"
    @question_response = gets.chomp.to_i
  end

  def validate()
    if @question_response != @answer
      puts "#{@players[@turn_index].name}: Seriously? No!"
      @players[@turn_index].reduce_life 1
    else 
      puts "#{@players[@turn_index].name}: YES! You are correct."
    end
  end

  def show_score()
    puts "#{@players[0].name}: #{@players[0].lives}/#{@number_of_lives} vs #{@players[1].name}: #{@players[1].lives}/#{@number_of_lives}"
  end

  def check_winner()
    if @players[0].lives == 0 || @players[1].lives == 0
      if @players[0].lives > players[1].lives
        puts "#{@players[0].name} wins with a score of #{@players[0].lives}/#{@number_of_lives}"
      else
        puts "#{@players[1].name} wins with a score of #{@players[1].lives}/#{@number_of_lives}"
      end
      puts "-------- GAME OVER! -----------"
      return true
    end
    return false
  end
end