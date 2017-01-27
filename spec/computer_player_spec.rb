require_relative '../lib/computer_player'
require_relative '../lib/player'
require_relative '../lib/board'

describe ComputerPlayer do 
  subject { described_class.new('x') }

  describe '#get_move' do

    it 'gets a random empty space from the board' do
      board = double(Board, positions: Array.new(9,nil))
      allow(board).to receive(:available_positions) { [0,2,4,6] }
      expect(board.available_positions.include?(
        subject.get_move(board))
      ).to be_truthy
    end
  end

end
