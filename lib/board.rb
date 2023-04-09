class Board
  attr_reader :ship

  def initialize
    @cells = {}
  end

  def make_cells
    letters = "A".."D"
    numbers = 1..4
    letters.map do |letter|
      numbers.map do |number|
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
      end
    end
  end

  def cells
    @cells
  end    
    
  def valid_coordinate?(coordinate)
    if @cells.has_key?(coordinate) then true
    else 
      false
    end
  end

  def valid_placement?(ship, coordinates = [])
    if (coordinates.count == ship.length) &&
      (!letter_validation(ship, coordinates) && number_validation(ship, coordinates)) || 
      (letter_validation(ship, coordinates) && !number_validation(ship, coordinates))
      placement_overlap(ship, coordinates)
    else
      false
    end
  end

  def number_validation(ship, coordinates = [])
    num_val = coordinates.map do |coord|
      coord[1].to_i
    end
    if (1..4).each_cons(ship.length).include?(num_val)
      true
    else
      false
    end
  end

  def letter_validation(ship, coordinates = [])
    let_val = coordinates.map do |coord|
      coord[0]
    end
    if ("A".."D").each_cons(ship.length).include?(let_val)
      true
    else
      false
    end
  end

  def place(ship, coordinates = [])
    coordinates.map do |coordinate|
      cells[coordinate].place_ship(ship)
    end
  end

  def placement_overlap(ship, coordinates = [])
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

end