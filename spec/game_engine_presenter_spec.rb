require_relative "../lib/game_engine_presenter"
require_relative "../lib/user_interface"

describe GameEnginePresenter do 

  subject { described_class.new }

  describe "prompting for user input" do
    let(:input) { double(:input) }
    before { allow(UserInterface).to receive(:input) { input } }

    describe "#prompt_for_game_type" do
      it "calls the UserInterface with a message asking for a game type selection" do
        message = "What type of game do you want to play?\n1 for choice1\n2 for choice2\n"
        expect(UserInterface).to receive(:output).with(message)
        subject.prompt_for_game_type(%w(choice1 choice2))
      end
    end

    describe "#prompt_for_move" do
      it "calls the UserInterface with a message asking the user to make a move" do
        message = "What is your move?\n"
        expect(UserInterface).to receive(:output).with(message)
        subject.prompt_for_move
      end
    end

    describe "#get_move" do
      it "calls the UserInterface with an invalid message and asks the user to make a move" do
        message1 = "That is not a valid option.\n"
        message2 = "Please enter a valid option.\n"
        expect(UserInterface).to receive(:output).with(message1)
        expect(UserInterface).to receive(:output).with(message2)
        subject.get_move(true)
      end
    end
  end

  describe "#output_result" do
    it "calls the UserInterface with the result message" do
      message = "RESULT: win, WINNER: x"
      expect(UserInterface).to receive(:output).with(message)
      subject.output_result("win", "x")
    end
  end

end