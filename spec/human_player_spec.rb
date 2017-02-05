require_relative '../lib/human_player'
require_relative '../lib/board'
require_relative '../lib/game_engine_presenter'

describe HumanPlayer do
  subject { described_class.new('x') }
  let(:game_engine_presenter) { double(GameEnginePresenter) }

  describe '#make_move' do
    it 'prompts the player to make a move' do
      expect(GameEnginePresenter).to receive(:new) { game_engine_presenter }
      expect(game_engine_presenter).to receive(:get_move)
      subject.make_move
    end
  end

end
