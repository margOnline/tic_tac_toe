require_relative '../lib/human_player'
require_relative '../lib/board'
require_relative '../lib/user_interface'

describe HumanPlayer do
  subject { described_class.new('x') }

  describe '#make_move' do
    it 'prompts the player to make a move' do
      expect(UserInterface).to receive(:get_move)
      subject.make_move
    end
  end

end
