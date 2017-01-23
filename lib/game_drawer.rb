class GameDrawer
  attr_accessor :positions

  EMPTY_MARK = ' '

  def self.draw_board(positions) 
    new(positions).draw_board
  end

  def initialize(positions)
    @positions = positions
  end

  def draw_board
    format_positions.each_slice(3) do | slice |
      puts slice.join(" | ")
    end
  end

  def format_positions
    positions.map{ |position| position.nil? ? EMPTY_MARK : position }
  end

end