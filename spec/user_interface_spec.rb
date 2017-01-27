require 'stringio'
require_relative '../lib/user_interface'

describe UserInterface do 

  describe '.get_move' do
    it 'prompts for a move' do
      stdin = StringIO.new('2')
      stdout = 
      expect(UserInterface.get_move(stdin, stdout)).to eq 2
      expect(stdout.string).to eq 'Please enter your move'
    end
  end
  
end