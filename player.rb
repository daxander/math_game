class Player
  attr_accessor :name, :lives, :score
  def initialize(name, lives, score)
    @name = name
    @lives = lives
    @score = score
  end

  def randomizer
    random = rand(1..3)
    case random
    when 1
      @answer = @first_number + @second_number
      puts "#{@name} : " + "What is #{@first_number} + #{@second_number}?".colorize(:light_blue)
    when 2
      @answer = @first_number * @second_number
      puts "#{@name} : " + "What is #{@first_number} x #{@second_number}?".colorize(:light_blue)
    when 3
      @answer = @first_number - @second_number
      puts "#{@name} : " + " What is #{@first_number} - #{@second_number}?".colorize(:light_blue)
    end
  end

  def gain_point
    if @player_answer == @answer 
      @score += 1
      puts "\nCorrect!\n".colorize(:light_green)
    elsif @player_answer != @answer
      @lives -= 1
      puts "\nYou Lost A Life!\n".colorize(:light_green)
    end
  end


  def generate_question
    @first_number = rand(1...20)
    @second_number = rand(1...20)
    randomizer
    @player_answer = gets.chomp.to_i
  end

end

