class Game
  attr_reader :board, :player, :computer, :place_ship, :valid_placement, :coordinates, :count, :valid_shot
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
      player_place_ship
      turn
    elsif
      p "Quit"
    end
  end

  def player_place_ship
    @player_ships.map do |ship|
      p "please choose #{ship.length} coordinates for your #{ship.name}"
      coordinates = gets.chomp.upcase.split
      until valid_placement = @player.board.valid_placement?(ship, coordinates) == true do
        p "These coordinates are invalid - please choose other coordinates to place your #{ship.name}"
        coordinates = gets.chomp.upcase.split
      end
      if valid_placement == true
        @player.board.place(ship, coordinates)
      end
    end
    @player.board.render(ship_pos = true)
  end

  def computer_place_ship
    @computer_ships.map do |ship|
      coordinates = [] 
      until @computer.board.valid_placement?(ship, coordinates) do
        coordinates = @computer.board.cells.keys.sample(ship.length)
      end
        coordinates
        @computer.board.place(ship, coordinates)
    end
    @computer.board.render(true)
  end
  
  def game_over
    if computer.cruiser.sunk? && computer.submarine.sunk?
      p "You win!!!"
    elsif player.cruiser.sunk? && player.submarine.sunk?
      p "You loose"
    end
  end

  def turn
    until game_over do
      p "=============COMPUTER BOARD============="
      @computer.board.render
      p "==============PLAYER BOARD=============="
      @player.board.render(true)
      p "Enter the coordinates for your shot"
      coord = nil
      coord = gets.chomp
      until @computer.board.valid_coordinate?(coord) == true
        p "Invalid coordinates, please choose a coordinate for your shot"
        coord = gets.chomp
      end
      @computer.board.cells[coord].fire_upon
      p "The computer has fired a shot"
      coord = @player.board.cells.keys.sample
      @player.board.cells[coord].fire_upon
    end
  end
end

