class GameEngine

  def self.start
    new.start
  end
  
  def initialize
    @game = Game.new
    @board = Board.new
    @player1 = HumanPlayer.new('x')
    @player2 = ComputerPlayer.new('o')
  end

  def start

  end

  def play
    until finished?
      draw_board
      current_player.move(board)
    end
    show_results
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
