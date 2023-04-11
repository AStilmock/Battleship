class Game
  # require "json"
  attr_reader :board, :player, :computer, :place_ship, :valid_placement, :coordinates, :count
  def initialize
    @player = Player.new
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @player_ships = [@player_cruiser, @player_submarine]
    @computer = Computer.new
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_ships = [@computer_cruiser, @computer_submarine]
  end

  def start_game
    @player_board
    @computer_board
    p "Welcome to BATTLESHIP\n"
    p "Enter p to play q to quit"
    start = gets.chomp
    if start == "p"
      p "The computer has placed its ships"
      player_place_ship
    elsif
      p "Quit"
    end
  end

  def player_place_ship
    @player_ships.each do |ship|
      p "please choose #{ship.length} coordinates for your #{ship.name}"
      coordinates = gets.chomp.split
      until valid_placement = @player_board.valid_placement?(ship, coordinates) == true
        p "These coordinates are invalid - please choose other coordinates to place your #{ship.name}"
        coordinates = gets.chomp.split
      end
      if valid_placement == true
        @player_board.place(ship, coordinates)
      end
    end
    @player_board.render(ship_pos = true)
  end

  

  def computer_place_ship
    valid_placement(ship, coordinates = [])
    # randomize place method?
    computer_ships.rand()
  end


  def turn
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

