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
    if empty?
      @fired_upon = true
      "miss"
    elsif fired_upon? == true
      "space already fired on"
    else
      @fired_upon = true
      @ship.hit
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