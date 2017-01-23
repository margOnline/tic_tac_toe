require_relative '../lib/game_drawer'


describe GameDrawer do 

  subject {GameDrawer.new(positions)}
  let(:positions) {positions = ['o', 'o', 'o', 'x', 'x', nil, 'x', nil, nil]}

  describe '#draw_board' do
    it 'prints the board' do
      expect(STDOUT).to receive(:puts).once.ordered.with(row1)
      expect(STDOUT).to receive(:puts).once.ordered.with(row2)
      expect(STDOUT).to receive(:puts).once.ordered.with(row3)
      subject.draw_board
    end
  end

  def row1
    "o | o | o"
  end

  def row2
    "x | x |  "
  end

  def row3
    "x |   |  "
  end
  
end