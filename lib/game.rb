class Game
  attr_reader :board, :player, :computer, :place_ship, :valid_placement, :coordinates, :count
  def initialize
    @player = Player.new
    @player_ships = [@player.cruiser, @player.submarine]
    @computer = Computer.new
    @computer_ships = [@computer.cruiser, @computer.submarine]
  end

  def start_game
    p "Welcome to BATTLESHIP\n"
    p "Enter p to play q to quit"
    start = gets.chomp
    if start == "p"
      p "The computer has placed its ships"
      computer_place_ship
      # player_place_ship
    elsif
      p "Quit"
    end
    # @computer.board.render(true)
    # @player.board.render(true)
  end

  def player_place_ship
    @player_ships.map do |ship|
      p "please choose #{ship.length} coordinates for your #{ship.name}"
      coordinates = gets.chomp.split
      until valid_placement = @player.board.valid_placement?(ship, coordinates) == true do
        p "These coordinates are invalid - please choose other coordinates to place your #{ship.name}"
        coordinates = gets.chomp.split
      end
      if valid_placement == true
        @player.board.place(ship, coordinates)
      end
    end
    @player.board.render(ship_pos = true)
  end

  def computer_place_ship
    # cells = @computer.board.cells.keys
    @computer_ships.map do |ship|
      coordinates = [] 
      # = cells.sample(ship.length)
      # require 'pry'; binding.pry
      until @computer.board.valid_placement?(ship, coordinates) do
        coordinates = @computer.board.cells.keys.sample(ship.length)
      end
        coordinates
        @computer.board.place(ship, coordinates)
    end
    @computer.board.render(true)
  end
  

  # def computer_valid_coordinates(ship)
  #   cells = @computer.board.cells.keys
  #   coordinates_array = []
  #   # @computer_ships.map do |ship|
  #   # coordinates = cells.sample(ship.length)
  #   while @computer.board.valid_placement?(ship, coordinates_array) == false do
  #     coordinates_array = cells.sample(ship.length)
  #   end
  #   coordinates_array
  # end

  # def computer_ship(ship)
  #   @computer.board.place(ship, computer_valid_coordinates(ship))
  # end


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

