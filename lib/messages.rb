module Messageable

  def player_hit_message
    p "Your shot on #{coordinate} was a hit!"
  end

  def player_miss_message
    p "Your shot on #{coordinate} was a miss!"
  end

  def computer_hit_message
    p "My shot on #{coordinate} was a hit!"
  end

  def computer_miss_message
    p "My shot on #{coordinate} was a miss!"
  end
end