require_relative '../lib/game'
require_relative '../lib/board'

describe Game do 

  subject {Game.new}

  describe '#play' do
    it 'calls the GameDrawer' do
      expect(GameDrawer).to receive(:draw_board).at_least(6).times
      subject.play
    end
  end

  describe '#winner' do
    it 'returns the marker of the winning combination' do
      subject.board.positions = ['o', 'o', 'o', 'x', 'x', nil, 'x', nil]
      expect(subject.winner).to eq 'o'
    end
  end

  describe '#whose_turn' do
    it 'returns player 1 when an even number of moves has been made' do
      subject.board.positions = [nil, 'x', 'o', nil, nil, nil, 'x', nil, nil]
      expect(subject.whose_turn).to eq 'o'
    end

    it 'returns player 2 when an odd number of moves has been made' do
      subject.board.positions = [nil, 'x', 'o', nil, nil, nil, nil, nil, nil]
      expect(subject.whose_turn).to eq 'x'
    end

    it 'returns player 1 when no moves have been made' do
      subject.board.positions = Array.new(9, nil)
      expect(subject.whose_turn).to eq 'x'
    end
  end

  describe '#finished?' do
    it 'returns true if the board is full' do
      subject.board.positions = %w(x x o o o x x o x)
      expect(subject.finished?).to be_truthy
    end

    it 'returns true if the board has a winner' do
      subject.board.positions = ['o', 'o', 'o', 'x', 'x', nil, 'x', nil]
      expect(subject.finished?).to be_truthy
    end

    it 'returns false if the board is not full and there is no winner' do
      subject.board.positions = [nil, 'x', 'o', nil, nil, nil, nil, nil, nil]
      expect(subject.finished?).to be_falsey

    end
  end

  describe 'result' do
    it 'returns "draw" if the game is a draw' do
      subject.board.positions = %w(x x o o o x x o x)
      expect(subject.result).to eq 'draw'
    end

    it 'returns "win" if there is a winner' do
      subject.board.positions = ['o', 'o', 'o', 'x', 'x', nil, 'x', nil]
      expect(subject.result).to eq 'win'
    end
  end
  
end