class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def make_move(board=nil, try_again=false)
    raise NotImplementedError
  end

end