require_relative 'player'

class HumanPlayer < Player

  def make_move(board=nil, try_again=false)
    GameEnginePresenter.new.get_move(try_again)
  end

end