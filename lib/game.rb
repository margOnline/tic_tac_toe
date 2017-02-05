require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'user_interface'

class Game
  attr_accessor :board, :player1, :player2

  RESULTS = {win: "win", draw: "draw"}
  
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def winner
    players.find{ |player| has_winning_mark?(player) }
  end

  def winner?
    board.winner?
  end

  def next_player
    even_number_of_moves? ? player1 : player2
  end

  def finished?
    board.winner? || board.full?
  end

  def result
    board.winner? ? RESULTS[:win] : RESULTS[:draw]
  end

  def valid_move?(position)
    board.valid_position?(position)
  end

  def update_board(move, mark)
    board.place_marker(move, mark)
  end

  def moves
    board.positions
  end

  private

  def players
    [player1, player2]
  end

  def has_winning_mark?(player)
    player.mark == board.winning_mark
  end

  def even_number_of_moves?
    board.positions.select{|position| position != nil}.count.even?
  end

end
