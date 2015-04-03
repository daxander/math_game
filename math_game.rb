
# initialize player_lives = 3
@player1 = {name: "Player1",
  lives: 3}
@player2 = {name: "Player2",
  lives: 3}     
@current_player = @player1   

def generate_question
  @first_number = rand(1...20)
  @second_number = rand(1...20)
  @answer = @first_number + @second_number
  puts "#{@current_player[:name]} What is #{@first_number} + #{@second_number}?"
end
# define generate_question

def run
  until (@player1[:lives] == 0 || @player2[:lives] == 0) do
     generate_question
     player_answer = gets.chomp
     if player_answer.to_i!= @answer
      @current_player[:lives] -= 1
      puts "#{@current_player[:name]} Lost One Life"
      puts "Lives: #{@player1[:name]} = #{@player1[:lives]} #{@player2[:name]} = #{@player2[:lives]}"
    end
    switch_player
  end
end

def switch_player
  if @current_player == @player1
    @current_player = @player2
  else 
    @current_player = @player1
  end
end

run
# loop until player1_lives || player2_lives = 0
#   generate_question for player1
#   if player1_answer = generate_question
#     generate_question for player2

#   else player1_answer != generate_question
#     player1_lives -= 1 
#     return player_lives
#   end
# if player1_lives || player2_lives = 0
    
#   end


