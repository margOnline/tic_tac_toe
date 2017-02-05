require_relative '../lib/game_engine'
require_relative '../lib/board'
require_relative '../lib/game'

describe GameEngine do 

  subject { described_class.new }
  let(:game) { double(Game) }

  describe '#play' do
    context 'when the game is in process' do
      before do 
        allow(game).to receive(:finished?) {true} 
        allow(game).to receive(:moves) { [] }
        allow(game).to receive(:winner?) { true } 
        allow(game).to receive(:winner) { double(Player, mark: 'x') } 
        allow(game).to receive(:result) { 'win' } 
        allow(game).to receive(:next_player) 
      end

      it 'draws the game board' do
        subject.game = game
        expect(UserInterface).to receive(:draw)
        subject.play
      end
    end

    context 'when the game is finished' do
      let(:board) { double(Board) }
      before { allow(subject).to receive(:finished?) { true } }
      before { allow(Board).to receive(:new) { board } }
      before { allow(board).to receive(:winner?) { true } }
      before { allow(board).to receive(:winner) { 'x' } }
      xit 'outputs the results' do
        expect(UserInterface).to receive(:output_results).once.with('win', 'x')
        subject.play
      end
    end
  end

  describe '#update_game' do
    let(:player) { double(Player, mark: 'x') }
    let(:move) { double(:move) }

    before { allow(game).to receive(:next_player) { player } }

    it 'sets a board position with the player\'s mark' do
      subject.game = game
      expect(game).to receive(:update_board).with(move, 'x')
      subject.update_game(move)
    end
  end
  
end