require_relative '../lib/game'
require_relative '../lib/board'

describe Game do 

  subject { described_class.new(board, player1, player2) }
  let(:board) { double(Board) }
  let(:player1) { double(Player, mark: 'x') }
  let(:player2) { double(Player, mark: 'o') }

  before {allow(board).to receive(:positions) { board_positions }}

  describe '#winner' do
    before {allow(board).to receive(:winning_mark) { 'o' } }

    it 'returns the player with the winning combination' do
      expect(subject.winner).to eq player2
    end
  end

  describe '#winner?' do

    context 'when there is winner' do
      before {allow(board).to receive(:winner?) { true } }

      it 'returns true' do
        expect(subject.winner?).to be_truthy
      end
    end

    context 'when there is not a winner' do
      before {allow(board).to receive(:winner?) { false } }

      it 'returns false' do
        expect(subject.winner?).to be_falsey
      end
    end
  end

  describe '#next_player' do
    context 'when an even number of moves has been made' do
      let(:board_positions) { [nil, 'x', 'o', nil, nil, nil, nil, nil, nil] }

      it 'returns player 1' do
        expect(subject.next_player).to eq subject.player1
      end
    end

    context 'when an odd number of moves has been made' do
      let(:board_positions) { [nil, 'x', 'o', nil, nil, nil, 'x', nil, nil] }

      it 'returns player 2' do
        expect(subject.next_player).to eq subject.player2
      end
    end

    context 'when no moves have been made' do
      let(:board_positions) { Array.new(9, nil) }

      it 'returns player 1' do  
        expect(subject.next_player).to eq subject.player1
      end
    end
  end

  describe '#finished?' do
    context 'when the board is full' do
      before {allow(board).to receive(:winner?) { false } }
      before {allow(board).to receive(:full?) { true } }

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

  describe '#result' do
    context 'when the game is a draw' do
      before {allow(board).to receive(:winner?) { false } }

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

  describe '#valid_move?' do
    let(:position) { double(:position) }

    context 'when the position is a valid board position' do
      before {allow(board).to receive(:valid_position?).with(position) { true } }

      it 'returns true' do
        expect(subject.valid_move?(position)).to be_truthy
      end
    end

    context 'when there is a winner' do
      before {allow(board).to receive(:valid_position?) { false } }

      it 'returns false' do
        expect(subject.valid_move?(position)).to be_falsey
      end
    end
  end

  describe '#update_board' do
    let(:move) { double(:move) }
    let(:mark) { double(:mark) }

    it 'calls the board with the player\'s move and marker' do  
      expect(board).to receive(:place_marker).with(move, mark)
      subject.update_board(move, mark)
    end
  end

  describe '#moves' do
    let(:board_positions) { double(:positions) }
    it 'gets all the positions of the board' do  
      expect(board).to receive(:positions)
      subject.moves
    end
  end

end