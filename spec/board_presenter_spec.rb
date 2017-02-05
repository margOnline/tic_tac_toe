require_relative '../lib/board_presenter'
require_relative '../lib/board'
require_relative '../lib/user_interface'

describe BoardPresenter do 

  subject { described_class.new(board) }
  let(:board) { double(Board) }

  describe '#draw' do
    let(:positions) { Array.new(9,nil)}

    it 'formats the board positions for displaying and calls the UserInterface' do
      board_to_string = "  |   |  \n  |   |  \n  |   |  \n\n"
      expect(board).to receive(:positions) { positions }
      expect(UserInterface).to receive(:output).with(board_to_string)
      subject.draw
    end
  end

end