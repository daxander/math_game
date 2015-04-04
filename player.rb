class Player
  attr_accessor :name
  attr_accessor :lives
  attr_accessor :score
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
      puts "Correct!"
    end
  end

  def lose_life
    if @player_answer != @answer
      @lives -= 1
      puts "You Lost A Life"
    end
  end

  def generate_question
    @first_number = rand(1...20)
    @second_number = rand(1...20)
    randomizer
  end

end

