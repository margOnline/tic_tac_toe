require_relative '../lib/human_player'

describe HumanPlayer do 

  describe 'initialize' do
    it 'takes one argument and sets the mark' do
      player = HumanPlayer.new('x')
      expect(player.mark).to eq 'x'
    end

    it 'raises an error if no arguments are received' do
      expect {HumanPlayer.new}.to raise_error(ArgumentError)
    end
  end
end
