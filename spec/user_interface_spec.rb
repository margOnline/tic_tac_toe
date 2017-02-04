require 'stringio'

require_relative '../lib/user_interface'
require_relative '../lib/game'

describe UserInterface do
  subject { described_class }
  let(:game) { double(Game)}

  describe '.output_result' do
    it 'outputs the a result string' do
      expect{subject.output_result("draw")}
        .to output("result: draw\n").to_stdout
    end

    it 'outputs the winner when provided' do
      expected_result = "result: win\nwinner: x\n"
      expect{subject.output_result("win", "x")}
        .to output(expected_result).to_stdout
    end
  end

  describe '.draw' do
    let(:positions) {positions = ['o', 'o', 'o', 'x', 'x', nil, 'x', nil, nil]}
    it 'outputs a grid representation of the board positions' do
      expect(STDOUT).to receive(:puts).once.ordered.with(row1)
      expect(STDOUT).to receive(:puts).once.ordered.with(row2)
      expect(STDOUT).to receive(:puts).once.ordered.with(row3)
      expect(STDOUT).to receive(:puts).once.ordered.with("\n")
      subject.draw(positions)
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
  