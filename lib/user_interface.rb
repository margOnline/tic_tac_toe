class UserInterface

  def self.output(string=nil)
    puts string
  end

  def self.input
    STDIN.gets.chomp.to_i  
  end

end