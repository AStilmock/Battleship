class Board
  attr_reader :ship, :valid_placement, :coordinates, :count
  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

    # def make_cells
    #   letters = "A".."D"
    #   numbers = 1..4
    #   letters.map do |letter|
    #     numbers.map do |number|
    #       @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
    #     end
    #   end
  

  def cells
    @cells
  end    
    
  def valid_coordinate?(coordinate)
    if @cells.has_key?(coordinate) then true
    else 
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if (coordinates.count == ship.length) &&
      (!letter_validation(ship, coordinates) && number_validation(ship, coordinates)) || 
      (letter_validation(ship, coordinates) && !number_validation(ship, coordinates)) 
      placement_overlap(ship, coordinates)
    else
      false
    end
  end

  def number_validation(ship, coordinates)
    num_val = coordinates.map do |coord|
      coord[1].to_i
    end
    if (1..4).each_cons(ship.length).include?(num_val)
      true
    else
      false
    end
  end

  def letter_validation(ship, coordinates)
    let_val = coordinates.map do |coord|
      coord[0]
    end
    if ("A".."D").each_cons(ship.length).include?(let_val)
      true
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def placement_overlap(ship, coordinates)
    coordinates.any? do |coordinate|
      # require 'pry'; binding.pry
      @cells[coordinate].empty?
    end
  end

  def render(ship_pos = false)
    if ship_pos == false
      puts "   1  2  3  4\n"
      puts "A  #{cells["A1"].render}  #{cells["A2"].render}  #{cells["A3"].render}  #{cells["A4"].render}"
      puts "B  #{cells["B1"].render}  #{cells["B2"].render}  #{cells["B3"].render}  #{cells["B4"].render}"
      puts "C  #{cells["C1"].render}  #{cells["C2"].render}  #{cells["C3"].render}  #{cells["C4"].render}"
      puts "D  #{cells["D1"].render}  #{cells["D2"].render}  #{cells["D3"].render}  #{cells["D4"].render}"
    elsif ship_pos == true
      puts "   1  2  3  4\n"
      puts "A  #{cells["A1"].render(true)}  #{cells["A2"].render(true)}  #{cells["A3"].render(true)}  #{cells["A4"].render(true)}"
      puts "B  #{cells["B1"].render(true)}  #{cells["B2"].render(true)}  #{cells["B3"].render(true)}  #{cells["B4"].render(true)}"
      puts "C  #{cells["C1"].render(true)}  #{cells["C2"].render(true)}  #{cells["C3"].render(true)}  #{cells["C4"].render(true)}"
      puts "D  #{cells["D1"].render(true)}  #{cells["D2"].render(true)}  #{cells["D3"].render(true)}  #{cells["D4"].render(true)}"
    end
  end
end