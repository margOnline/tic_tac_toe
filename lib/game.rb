require_relative 'board'
require_relative 'game_drawer'

class Game
  attr_accessor :player1, :player2, :board
  

  def initialize
    @board = Board.new
    @player1 = "x"
    @player2 = "o"
  end

  def play
    until finished?
      draw_board
      make_move 
    end
    show_results
  end

  def winner
    board.winner
  end

  def whose_turn
    even_number_of_moves? ? player1 : player2
  end

  def finished?
    board.winner? || board.full?
  end

  def mark_board(position, player)
    board.positions[position] = player if board.valid_position?(position) 
  end

  def result
    board.winner? ? 'win' : 'draw'
  end

  def make_move
    position = board.available_positions.sample
    puts "\n#{whose_turn} marked the board at position: #{position}\n\n"
    mark_board(position, whose_turn)
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
    puts "\nresult: #{result}"
    puts "winner: #{winner}" if board.winner?
  end

end

game = Game.new
game.play
