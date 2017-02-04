require_relative 'player'

class ComputerPlayer < Player

  def make_move(board=nil, try_again=false)
    board.available_positions.sample
  end

end