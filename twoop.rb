require_relative 'player'
require 'colorize'

def get_name
  puts "Player 1 What is your name?"
  player1_name = gets.chomp
  @player1 = Player.new(player1_name, 3, 0)
  puts "Player 2 What is your name?"
  player2_name = gets.chomp
  @player2 = Player.new(player2_name, 3 , 0)
end

def winner
  if @player1.lives > @player2.lives
    puts "#{@player1.name} is the Winner!"
    puts "With a Score of #{@player1.score}!"
  else
    puts "#{@player2.name} is the Winner!"
    puts "With a Score of #{@player1.score}!"
  end
end

def switch_player
  if @current_player == @player1
    @current_player = @player2
  else 
    @current_player = @player1
  end
end

def run
  get_name
  @current_player = @player1
  until @player1.lives == 0 || @player2.lives == 0 do
     @current_player.generate_question
     @player_answer = gets.chomp
     @current_player.gain_point
     @current_player.lose_life
    switch_player
  end
  winner
end

def again
  puts "Would you like to play again? (yes/no)"
  play_again = gets.chomp.downcase
  if play_again == 'yes'
    @player1.lives = 3
    @player2.lives = 3
    run
  else play_again == 'no'
    puts "Good-Bye"
  end
end

run
again

# def get_name
#   if @player1[:name] == "Player1"
#     puts "Player 1 What is your name?"
#     @player1[:name] = gets.chomp.green
#   end
#   if @player2[:name] == "Player2"
#     puts "Player 2 What is your name?"
#     @player2[:name] = gets.chomp.yellow
#   end
# end