require 'stringio'

require_relative '../lib/user_interface'

describe UserInterface do
  subject { described_class }

  describe '.output' do
    it 'outputs the string to the cli' do
      expect{subject.output("message")}
        .to output("message\n").to_stdout
    end
  end

  describe '.input' do
    it 'takes input from the cli and converts it to an integer' do
      expect(STDIN).to receive_message_chain(:gets, :chomp, :to_i)
      subject.input
    end
  end

end
