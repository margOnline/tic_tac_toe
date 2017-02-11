class GameEnginePresenter

  USER_MESSAGES = {
    prompt_for_move: "What is your move?",
    prompt_for_game_type: "What type of game do you want to play?",
    try_again: "Please enter a valid option.",
    invalid_option: "That is not a valid option.",
    result: "RESULT:",
    winner: "WINNER:"
  }

  def initialize
  end

  def prompt_for_game_type(game_types, try_again = false)
    user_message = try_again ? invalid_option : prompt_for_game_type_message(game_types)
    output add_newline(user_message)
    accept_input
  end

  def get_move(try_again = false)
    try_again ? invalid_option : prompt_for_move
  end

  def prompt_for_move(prompt=USER_MESSAGES[:prompt_for_move])
    output add_newline(prompt)
    accept_input
  end

  def output_result(result, winner=nil)
    output(result_message(result, winner))
  end

  private
  def output(string)
    UserInterface.output(string)
  end

  def accept_input
    UserInterface.input
  end

  def add_newline(string)
    "#{string}\n"
  end

  def invalid_option
    output add_newline(USER_MESSAGES[:invalid_option])
    prompt_for_move(USER_MESSAGES[:try_again])
  end

  def result_message(result, winner)
    message =  "#{USER_MESSAGES[:result]} #{result}"
    message += ", #{USER_MESSAGES[:winner]} #{winner}" if winner
    message
  end

  def prompt_for_game_type_message(game_types)
    message = add_newline(USER_MESSAGES[:prompt_for_game_type])
    message += game_types_to_string(game_types)
    message
  end

  def game_types_to_string(game_types)
    game_types.map.each_with_index do |type, index|
      "#{index+1} for #{type}"
    end.join("\n")
  end

end