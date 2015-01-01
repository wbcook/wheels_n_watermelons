# Rolls high, medium or low dice rolls to determine if a project is generously funded
# skipped, or funded just one time.

class Die
  attr_reader :number

  def initialize
    roll
  end

  def roll
    @number = rand(1..6)
  end
end
