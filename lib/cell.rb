require "./lib/messages"

class Cell
include Messageable
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

  def player_fire_upon
    if fired_upon == true
      p "space already fired on"
    end
    if empty?
      @fired_upon = true
      player_miss_message
    else
      @fired_upon = true
      @ship.hit
      player_hit_message
      if ship.sunk?
        p "My #{ship.name} was sunk"
      end
    end
  end

  def computer_fire_upon
    if fired_upon == true
      p "space already fired on"
    end
    if empty?
      @fired_upon = true
      computer_miss_message
    else
      @fired_upon = true
      @ship.hit
      computer_hit_message
      if ship.sunk?
        p "Your #{ship.name} was sunk"
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
      if empty? == false && fired_upon? == false then "S"
      elsif fired_upon? == false then "."
      elsif fired_upon? == true && empty? then "M"
      elsif fired_upon? == true && empty? == false && ship.sunk? == false then "H"
      elsif ship.sunk? == true then "X"
      end
    end
  end
end