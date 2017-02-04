require_relative 'board'
require_relative 'player'
require_relative 'game_drawer'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'user_interface'

class Game
  attr_accessor :player1, :player2, :board
  
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def winner
    board.winner
  end

  def current_player
    even_number_of_moves? ? player1 : player2
  end

  def finished?
    board.winner? || board.full?
  end

  def result
    board.winner? ? 'win' : 'draw'
  end

  private

  def even_number_of_moves?
    board.positions.select{|position| position != nil}.count.even?
  end

  def draw_board
    GameDrawer.draw_board(board.positions)
  end

  def show_results
    draw_board
    game_winner = board.winner? ? winner : nil
    output_results(result, game_winner)
  end

  def output_results(result, winner)
    UserInterface.output_result(result, winner)
  end

end
