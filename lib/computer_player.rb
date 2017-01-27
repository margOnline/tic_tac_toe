require_relative 'player'

class ComputerPlayer < Player

  def move(board)
    position = get_move(board)
    mark_board(board, position)
  end

  def get_move(board)
    board.available_positions.sample
  end

end