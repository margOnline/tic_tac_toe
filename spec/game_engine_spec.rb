require_relative '../lib/game_engine'
require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/board_presenter'
require_relative '../lib/game_engine_presenter'

describe GameEngine do 

  subject { described_class.new }
  let(:game) { double(Game, board: board) }
  let(:board) { double(Board) }
  let(:player) { double(Player, mark: 'x') }
  let(:board_presenter) { double(BoardPresenter) }
  let(:game_engine_presenter) { double(GameEnginePresenter) }

  before do 
    subject.game = game
    subject.board_presenter = board_presenter
    subject.game_engine_presenter = game_engine_presenter
  end

  describe '#play' do
    context 'when the game is in process' do
      before do 
        allow(game).to receive(:finished?).and_return(false, false, false, true)
        allow(game).to receive(:next_player) { player }
        allow(player).to receive(:make_move).with(board)
        allow(game).to receive(:valid_move?) {true}
        allow(player).to receive(:mark)
        allow(game).to receive(:update_board) {true}
        allow(game).to receive(:winner?) { false }
        allow(game).to receive(:result) { 'tie' }
        allow(game_engine_presenter).to receive(:output_result).with("tie", nil)
      end

      it 'draws the game board every time there is a move' do
        expect(board_presenter).to receive(:draw).exactly(4).times
        subject.play
      end
    end

    context 'when the game is finished' do   
      before do 
        allow(subject).to receive(:finished?) { true }
        allow(board_presenter).to receive(:draw)
        allow(game).to receive(:winner?) { true } 
        allow(game).to receive(:winner) { 'x' }
        allow(game).to receive(:result) { 'win' }   
      end

      it 'outputs the results' do       
        expect(subject.game_engine_presenter).to receive(:output_result).once.with('win', 'x')
        subject.play
      end
    end
  end

  describe '#update_game' do
    let(:move) { double(:move) }

    before { allow(game).to receive(:next_player) { player } }

    it 'sets a board position with the player\'s mark' do
      subject.game = game
      expect(game).to receive(:update_board).with(move, 'x')
      subject.update_game(move)
    end
  end
  
end