require_relative '../lib/board'

describe Board do 

  subject {Board.new}

  describe '#initialize' do
    it 'sets the positions to an array of 9 nil elements' do
      expect(subject.positions.length).to eq 9
    end
  end

  describe '#place_marker' do
    it 'fills a position with a marker' do
      subject.place_marker(3, 'x')
      expect(subject.positions).to eq [nil,nil,nil,'x',nil,nil,nil,nil,nil,]
    end
  end

  describe '#full?' do
    it 'returns true if all the positions are full' do
      subject.positions = %w(x o x x o x x o o)
      expect(subject.full?).to be_truthy
    end

    it 'returns false if at least one position is nil' do
      subject.positions = (Array.new(8,'o') + [nil])
      expect(subject.full?).to be_falsey
    end
  end

  describe '#winner?' do
    it 'returns true if there is a winning combination' do
      subject.positions = %w(x o x x o x x o o)
      expect(subject.winner?).to be_truthy
    end

    it 'returns false if all the positions are full and there is no winning combination' do
      subject.positions = %w(x x o o o x x o x)
      expect(subject.winner?).to be_falsey
    end
  end

  describe '#winning_mark' do
    context 'when the winning combination is a' do
      it 'diagonal, returns the marker' do
        subject.positions = ['o', nil, nil, 'x', 'o', 'x', nil, nil, 'o']
        expect(subject.winning_mark).to eq 'o'
      end

      it 'column, returns the marker' do
        subject.positions = [nil, 'x', 'o', nil, 'x', 'o', 'o', 'x', 'x']
        expect(subject.winning_mark).to eq 'x'
      end

      it 'row, returns the marker' do
        subject.positions = %w(x x o x o x o o o)
        expect(subject.winning_mark).to eq 'o'
      end
    end
  end

  describe '#draw?' do
    it 'returns true if all the positions are full and there is no winning combination' do
      subject.positions = %w(x x o o o x x o x)
      expect(subject.draw?).to be_truthy
    end

    it 'returns false if all the positions are full and there is a winning combination' do
      subject.positions = %w(x x x o o x x o o)
      expect(subject.draw?).to be_falsey
    end
  end

  describe '#valid_position?' do
    before(:each) { subject.positions = [nil, 'x', 'o', nil, nil, nil, nil, nil, 'x'] }

    it 'returns true if the selected position is on the board and not taken' do
      expect(subject.valid_position?(3)).to be_truthy
    end

    it 'returns false if the selected position is off the board' do
      expect(subject.valid_position?(9)).to be_falsey
    end

    it 'returns false if the selected position is taken' do
      expect(subject.valid_position?(2)).to be_falsey
    end
  end

  describe '#available_positions' do
    context 'at the start of the game' do
      it 'returns an array with the numbers 0 through 8' do
        expect(subject.available_positions).to eq (0..8).to_a
      end
    end

    context 'in the middle of the game' do
      it 'returns an array with the positions which equal nil' do
        subject.positions = [nil, 'x', 'o', nil, nil, nil, nil, nil, 'x']
        expect(subject.available_positions).to eq [0,3,4,5,6,7]
      end
    end

    context 'when the board is full' do
      it 'returns an empty array' do
        subject.positions = Array.new(9, 'x')
        expect(subject.available_positions).to eq []
      end
    end
  end
  
end