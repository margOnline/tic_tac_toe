class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def move
    raise NotImplementedError
  end

  def mark_board(board, position)
    board.positions[position] = mark
  end

end