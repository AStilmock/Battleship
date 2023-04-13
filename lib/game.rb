class Game
  attr_reader :board, :player, :computer
  def initialize
    @player = Player.new
    @player_ships = [@player.cruiser, @player.submarine]
    @computer = Computer.new
    @computer_ships = [@computer.cruiser, @computer.submarine]
  end

  def start_game
    p "Welcome to BATTLESHIP"
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

  def restart
    game = Game.new
    @player = Player.new
    @computer = Computer.new
    game.start_game
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
  end
  
  def game_over?
    game_over = false
    if computer.cruiser.sunk? && computer.submarine.sunk?
      p "You win!!!"
      game_over = true
      p "=============COMPUTER BOARD============="
      @computer.board.render
      p "==============PLAYER BOARD=============="
      @player.board.render(true)
      restart
    elsif player.cruiser.sunk? && player.submarine.sunk?
      p "You loose"
      `say -v Bad "di di di di di di di di di di di di di di di di di di di di di di di di di di di di di di di di"`
      game_over = true
      restart
    end
  end

  def turn
    until game_over? == true do
      p "=============COMPUTER BOARD============="
      @computer.board.render
      p "==============PLAYER BOARD=============="
      @player.board.render(true)
      p "Enter the coordinates for your shot"
      coord1 = nil
      coord1 = gets.chomp.upcase
      until @computer.board.valid_coordinate?(coord1) == true
        p "Invalid coordinates, please choose a coordinate for your shot"
        coord1 = gets.chomp.upcase
      end
      coord1
      @computer.board.cells[coord1].player_fire_upon
      game_over?
      p "The computer has fired a shot"
      coord2 = @player.board.cells.keys.sample
      until @player.board.valid_coordinate?(coord2) == true
        coord2 = @player.board.cells.keys.sample
      end
      coord2
      @player.board.cells[coord2].computer_fire_upon
    end
    game_over?
  end
end

