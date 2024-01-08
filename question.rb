class Question
  attr_reader :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def ask_question(player)
    puts "#{player.name}: What does #{@num1} plus #{@num2} equal?"
    player_answer = gets.chomp.to_i
    correct = player_answer == @answer
    puts correct ? "#{player.name}: YES! You are correct." : "#{player.name}: Seriously? No!"
    correct
  end
end