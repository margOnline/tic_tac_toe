require_relative '../lib/player'
require_relative '../lib/board'

describe Player do 

  describe 'initialize' do
    it 'takes one argument and sets the mark' do
      player = Player.new('x')
      expect(player.mark).to eq 'x'
    end

    it 'raises an error if no arguments are received' do
      expect {Player.new}.to raise_error(ArgumentError)
    end
  end

  describe '#move' do
    let(:player) { Player.new('x') }

    it 'raises an error if the move method is not implemented' do
      expect{player.move}.to raise_error(NotImplementedError)
    end
  end

  describe '#mark_board' do
    let(:player) { Player.new('x') }
    let(:board) { double(Board) }

    it 'sets a board position with the player\'s mark' do
      expect(board).to receive(:place_marker).with(3, 'x')
      player.mark_board(board, 3)
    end
  end

end

