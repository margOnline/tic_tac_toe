class UserInterface

  EMPTY_MARK = ' '

  USER_MESSAGES = {
    prompt_for_move: "What is your move?",
    try_again: "Please enter a valid position.",
    invalid_move: "That is not a valid move.",
    result: "result: ",
    winner: "winner: "
  }

  def self.get_move(try_again = false)
    try_again ? invalid_move : prompt_for_move
  end

  def self.prompt_for_move(prompt=USER_MESSAGES[:prompt_for_move])
    output add_newline(prompt)
    receive_input
  end

  def self.receive_input
    STDIN.gets.chomp.to_i  
  end

  def self.invalid_move
    output add_newline(USER_MESSAGES[:invalid_move])
    prompt_for_move(USER_MESSAGES[:try_again])
  end

  def self.draw(game_board)
    format_positions(game_board).each_slice(3) do | slice |
      puts slice.join(" | ")
    end
    puts "\n"
  end

  def self.prompt_for_game_type(game_types)
    prompt = "Please enter\n" 
    prompt += game_types.map.each_with_index do |type, index|
      "#{index+1} for #{type}"
    end.join("\n")
    output add_newline(prompt)
    receive_input
  end

  def self.output_result(result, winner=nil)
    output "#{USER_MESSAGES[:result]}#{result}"
    output "#{USER_MESSAGES[:winner]}#{winner}" if winner
  end

  private
  def self.output(string=nil)
    puts add_newline(string)
  end

  def self.add_newline(string)
    "#{string}\n"
  end

  def self.format_positions(positions)
    positions.map{ |position| position.nil? ? EMPTY_MARK : position }
  end

end