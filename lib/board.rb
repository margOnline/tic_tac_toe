class Board
  attr_accessor :positions

  WINNING_COMBINATIONS = [ 
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8],
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  VALID_POSITIONS = (0..8)

  def initialize
    @positions = Array.new(9, nil)
  end

  def full?
    positions.all?{ |position| position }
  end

  def valid_position?(position)
    VALID_POSITIONS.include?(position) && available?(position)
  end

  def available_positions
    positions.map.with_index{ |position, index| index if position.nil? }.compact
  end

  def winner?
    WINNING_COMBINATIONS.find do |combination|
      winning_combination?(combination)
    end
  end

  def draw?
    full? && !winner?
  end

  def winner
    winning_position = WINNING_COMBINATIONS.find { |combination| winning_combination?(combination)}.first
    positions[winning_position]
  end

  private

  def winning_combination?(combination)
    combination.all? do |position|
      winning_marker?(position, combination[0])
    end
  end

  def winning_marker?(position1, position2)
    positions[position1] != nil && same_marker?(position1, position2)
  end

  def same_marker?(position1, position2)
    positions[position1] == positions[position2]
  end

  def available?(position)
    !!positions[position].nil?
  end

end