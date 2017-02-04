require_relative '../lib/game'
require_relative '../lib/board'

describe Game do 

  subject { described_class.new(board, player1, player2) }
  let(:board) { double(Board) }
  let(:player1) { double(Player) }
  let(:player2) { double(Player) }

  before {allow(board).to receive(:positions) { board_positions }}

  describe '#winner' do
    before {allow(board).to receive(:winner) { 'o' } }

    it 'returns the marker of the winning combination' do
      expect(subject.winner).to eq 'o'
    end
  end

  describe '#current_player' do
    context 'when an even number of moves has been made' do
      let(:board_positions) { [nil, 'x', 'o', nil, nil, nil, nil, nil, nil] }

      it 'returns player 1' do
        expect(subject.current_player).to eq subject.player1
      end
    end

    context 'when an odd number of moves has been made' do
      let(:board_positions) { [nil, 'x', 'o', nil, nil, nil, 'x', nil, nil] }

      it 'returns player 2' do
        expect(subject.current_player).to eq subject.player2
      end
    end

    context 'when no moves have been made' do
      let(:board_positions) { Array.new(9, nil) }

      it 'returns player 1' do  
        expect(subject.current_player).to eq subject.player1
      end
    end
  end

  describe '#finished?' do
    context 'when the board is full' do
      before {allow(board).to receive(:winner?) { false } }
      before {allow(board).to receive(:full?) { true } }
      # let(:board_positions) { %w(x x o o o x x o x)}

      it 'returns true' do
        expect(subject.finished?).to be_truthy
      end
    end

    context 'when the board has a winner' do
      before {allow(board).to receive(:winner?) { true } }

      it 'returns true' do
        expect(subject.finished?).to be_truthy
      end
    end

    context 'when the board is not full and there is no winner' do
      before {allow(board).to receive(:winner?) { false } }
      before {allow(board).to receive(:full?) { false } }

      it 'returns false' do
        expect(subject.finished?).to be_falsey
      end
    end
  end

  describe 'result' do
    context 'when the game is a draw' do
      before {allow(board).to receive(:winner?) { false } }
      let(:board_positions) { %w(x x o o o x x o x) }

      it 'returns "draw"' do
        expect(subject.result).to eq 'draw'
      end
    end

    context 'when there is a winner' do
      before {allow(board).to receive(:winner?) { true } }

      it 'returns "win"' do
        expect(subject.result).to eq 'win'
      end
    end
  end
  
end