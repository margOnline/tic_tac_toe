require_relative 'board'
require_relative 'board_presenter'
require_relative 'game_engine_presenter'
require_relative 'player'
require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'user_interface'

class GameEngine
  attr_accessor :game, :board_presenter, :game_engine_presenter

  GAME_TYPES = [
    'Human v Human',
    'Human v Computer',
    'Computer v Computer'
  ]

  def self.setup_game
    new.setup_game
  end

  def initialize
    @game_engine_presenter = GameEnginePresenter.new
    board = Board.new
    @board_presenter = BoardPresenter.new(board)
  end

  def setup_game
    players = create_players_for_game_type
    @game = Game.new(board_presenter.board, players.first, players.last)
  end

  def play
    until finished?
      display_board
      move = get_move
      update_game(move)
    end
    show_results
  end

  def update_game(move)
    game.update_board(move, next_player.mark)
  end

  private
  def create_players_for_game_type
    game_type = determine_game_type
    setup_players_for(game_type)
  end

  def determine_game_type
    game_type = ''
    until valid_game_type?(game_type)
      game_type = game_engine_presenter.prompt_for_game_type(GAME_TYPES)
    end
    game_type
  end

  def finished?
    game.finished?
  end

  def display_board
    board_presenter.draw
  end

  def get_move
    position = next_player.make_move(game.board)
    if valid_move?(position)
      position 
    else
      next_player.make_move(game.board, true)
    end
  end

  def next_player
    game.next_player
  end

  def show_results
    display_board
    game_winner = game.winner? ? game.winner : nil
    output_result(game.result, game_winner)
  end

  def output_result(result, winner)
    game_engine_presenter.output_result(result, winner)
  end

  private

  def valid_move?(position)
    game.valid_move?(position)
  end

  def valid_game_type?(input)
    (0..GAME_TYPES.length-1).map{|i| i+1 }.include?(input.to_i)
  end

  def game_board
    game.moves
  end

  def setup_players_for(game_type)
    case game_type
    when 1
      [HumanPlayer.new('x'), HumanPlayer.new('o')]
    when 2
      [HumanPlayer.new('x'), ComputerPlayer.new('o')]
    when 3
      [ComputerPlayer.new('x'), ComputerPlayer.new('o')]
    else
      false
    end
  end

end
