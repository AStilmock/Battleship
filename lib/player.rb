class Player 
  attr_reader :board, :cruiser, :submarine, :place_ship
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
end