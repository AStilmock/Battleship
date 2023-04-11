require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/game"
require "./lib/player"
require "./lib/computer"
require "./lib/messages"

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end
  describe "initialize" do
    it "exists" do
      expect(@game).to be_an_instance_of(Game)
    end
    it "can play" do
      @game.start_game
    end
  end
end