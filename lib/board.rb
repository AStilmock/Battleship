class Board

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
end