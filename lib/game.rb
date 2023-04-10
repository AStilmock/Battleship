class Game

attr_reader :board, :player, :computer
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

  def player_place_ship(ship, coordinates = [])
    if valid_placement(ship, coordinates = [])
      place(ship, coordinates = [])
    else
      "These coordinates are invalid - please choose other coordinates to place your ship"
    end
  end

  def computer_place_ship
    valid_placement(ship, coordinates = [])
    # randomize place method?
  end

  def turn
    # After ships have been placed by player/computer
    # Displaying the boards
    # render(ship_pos = false)
    # render(ship_pos = true)
    # # Player choosing a coordinate to fire on
    # fire_upon method?
    # # Computer choosing a coordinate to fire on
    # fire_upon method?
    # # Reporting the result of the Player’s shot
    # return hit/miss from fire_upon method?
    # # Reporting the result of the Computer’s shot
    # return hit/miss from fire_upon method?
  end
end

