class Cell
  attr_reader :coordinate, :ship, :fired_upon, :fire_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_type)
    @ship = ship_type
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    valid_shot = false
    until valid_shot == true
      if fired_upon == true
        p "space already fired on"
        valid_shot = false
      end
      if empty?
        @fired_upon = true
        p "your shot on #{coordinate} was a miss"
        valid_shot = true
      else
        @fired_upon = true
        @ship.hit
        p "your shot on #{coordinate} was a hit"
        valid_shot = true
        if ship.sunk?
          p "The #{ship} was sunk"
        end
      end
    end
  end

  def render(ship_pos = false)
    if ship_pos == false
      if fired_upon? == false then "."
      elsif fired_upon? == true && empty? then "M"
      elsif fired_upon? == true && empty? == false && ship.sunk? == false then "H"
      elsif ship.sunk? == true then "X"
      end
    elsif ship_pos == true
      if empty? == false then "S"
      elsif fired_upon? == false then "."
      elsif fired_upon? == true && empty? then "M"
      elsif fired_upon? == true && empty? == false && ship.sunk? == false then "H"
      elsif ship.sunk? == true then "X"
      end
    end
  end
end