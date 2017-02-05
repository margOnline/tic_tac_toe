require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'user_interface'

class GameEngine
  attr_accessor :game

  GAME_TYPES = [
    'Human v Human',
    'Human v Computer',
    'Computer v Computer'
  ]

  def self.setup_game
    new.setup_game
  end
  
  def initialize
  end

  def setup_game
    players = determine_game_type
    board = Board.new
    @game = Game.new(board, players.first, players.last)
  end

  def play
    until finished?
      draw_board
      move = get_move
      update_game(move)
    end
    show_results
  end

  def determine_game_type
    game_type = UserInterface.prompt_for_game_type(GAME_TYPES)
    setup_players_for(game_type)
  end

  def finished?
    game.finished?
  end

  def draw_board
    UserInterface.draw(game_board)
  end

  def get_move
    position = next_player.make_move(game.board)
    if valid_move?(position)
      position 
    else
      next_player.make_move(game.board, true)
    end
  end

  def update_game(move)
    game.update_board(move, next_player.mark)
  end

  def next_player
    game.next_player
  end

  def show_results
    draw_board
    game_winner = game.winner? ? game.winner : nil
    output_results(game.result, game_winner)
  end

  def output_results(result, winner)
    UserInterface.output_result(result, winner)
  end

  private

  def valid_move?(position)
    game.valid_move?(position)
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
