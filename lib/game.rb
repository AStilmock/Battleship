class Game

attr_reader :player, :computer
  def initialize
    @board              = Board.new
    @player             = Player.new
    @player_cruiser     = Ship.new("Cruiser", 3)
    @player_submarine   = Ship.new("Submarine", 2)
    @player_ships       = [@player_cruiser, @player_submarine]
    @computer           = Computer.new
    @computer_cruiser   = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_ships     = [@computer_cruiser, @computer_submarine]
  end