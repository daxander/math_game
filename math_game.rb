require 'colorize'

@player1 = {name: "Player1",
  lives: 3, score: 0}
@player2 = {name: "Player2",
  lives: 3, score: 0}     
@current_player = @player1   

def get_name
  if @player1[:name] == "Player1"
  puts "Player 1 What is your name?"
  @player1[:name] = gets.chomp.green
end
  if @player2[:name] == "Player2"
  puts "Player 2 What is your name?"
  @player2[:name] = gets.chomp.yellow
end
end

def randomizer
  random = rand(1..3)
  case random
  when 1
    @answer = @first_number + @second_number
    puts "#{@current_player[:name]} : " + "What is #{@first_number} + #{@second_number}?".colorize(:light_blue)
  when 2
    @answer = @first_number * @second_number
    puts "#{@current_player[:name]} : " + "What is #{@first_number} x #{@second_number}?".colorize(:light_blue)
  when 3
    @answer = @first_number - @second_number
    puts "#{@current_player[:name]} : " + " What is #{@first_number} - #{@second_number}?".colorize(:light_blue)
  end
end

def generate_question
  @first_number = rand(1...20)
  @second_number = rand(1...20)
  randomizer
end

def winner
  if @player1[:lives] > @player2[:lives]
    puts "#{@player1[:name]} is the Winner!"
    puts "With a Score of #{@player1[:score]}!"
  else
    puts "#{@player2[:name]} is the Winner!"
    puts "With a Score of #{@player1[:score]}!"
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
  until (@player1[:lives] == 0 || @player2[:lives] == 0) do
     generate_question
     player_answer = gets.chomp
     if 
      player_answer.to_i != @answer
      @current_player[:lives] -= 1
      puts
      puts "#{@current_player[:name]} Lost One Life"
      puts
      puts "Lives: #{@player1[:name]} = #{@player1[:lives]} #{@player2[:name]} = #{@player2[:lives]}" 
      puts
    else
      @current_player[:score] += 1
      puts
      puts "Correct!".colorize(:cyan)
      puts
    end
    switch_player
  end
  winner
end

def again
  puts "Would you like to play again? (yes/no)"
  play_again = gets.chomp.downcase
  if play_again == 'yes'
    @player1[:lives] = 3
    @player2[:lives] = 3
    run
  else
    puts "Good-Bye"
  end
end

run
again




