require_relative '../lib/game_engine'
require_relative '../lib/board'

describe GameEngine do 

  subject { described_class.new }

    describe '#play' do
    it 'calls the GameDrawer' do
      expect(GameDrawer).to receive(:draw_board).at_least(6).times
      subject.play
    end

    context 'at the end of the game' do
      let(:board) { double(Board) }
      before { allow(subject).to receive(:finished?) { true } }
      before { allow(Board).to receive(:new) { board } }
      before { allow(board).to receive(:winner?) { true } }
      before { allow(board).to receive(:winner) { 'x' } }
      it 'outputs the results' do
        expect(UserInterface).to receive(:output_results).once.with('win', 'x')
        subject.play
      end
    end
  end
  
end