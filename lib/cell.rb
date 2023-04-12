class Cell
  attr_reader :coordinate, :ship, :fired_upon, :fire_upon, :valid_shot
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
    if fired_upon == true
      p "space already fired on"
    end
    if empty?
      @fired_upon = true
      p "your shot on #{coordinate} was a miss"
    else
      @fired_upon = true
      @ship.hit
      p "your shot on #{coordinate} was a hit"
      if ship.sunk?
        p "The #{ship.name} was sunk"
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