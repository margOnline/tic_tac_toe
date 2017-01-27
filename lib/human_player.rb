require_relative 'player'

class HumanPlayer < Player

  def move(board)
    position = get_move(board)
    mark_board(board, position)
  end

  def get_move(board)
    board.available_positions.sample
  end

  #TODO validate mark?
end