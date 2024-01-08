require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = 0
  end

  def play
    until game_over?
      question = Question.new
      correct = question.ask_question(@players[@current_player])
      @players[@current_player].lose_life unless correct

      display_scores

      switch_player
      puts "-----NEW TURN-----"
    end

    announce_winner
    puts "------GAME OVER------\nGoodbye!"
  end

  private

  def game_over?
    @players.any? { |player| player.lives == 0 }
  end

  def display_scores
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
  end

  def switch_player
    @current_player = (@current_player + 1) % 2
  end

  def announce_winner
    winner = @players.find { |player| player.lives > 0 }
    loser = @players.find { |player| player.lives == 0 }
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "#{loser.name}: #{loser.lives}/3"
  end
end