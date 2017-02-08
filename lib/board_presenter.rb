class BoardPresenter
  attr_accessor :board

  EMPTY_MARK = ' '

  def initialize(board)
    @board = board
  end

  def draw
    rows = format_rows
    output(stringify(rows))
  end

  private
  def output(string)
    UserInterface.output(string)
  end

  def format_rows
    array = []
    format_positions(board.positions).each_slice(3) do | slice |
      array << add_pipes(slice)
    end
    array
  end

  def stringify(array)
    array.map{|row| row + "\n"}.join('') + "\n"
  end

  def add_pipes(array)
    array.join(" | ")
  end

  def format_positions(positions)
    positions.map{ |position| position.nil? ? EMPTY_MARK : position }
  end

end