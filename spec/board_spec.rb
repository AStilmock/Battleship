require "./lib/ship"
require "./lib/cell"
require "./lib/board"

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe "initialize" do
    it "exitsts" do
      expect(@board).to be_an_instance_of(Board)
    end

    it "checks for cells" do
      expect(@board.cells).to be_a(Hash)
    end
  end

  describe "validating coordinates" do
    it "can validate coordinates" do
      expect(@board.valid_coordinate?("A1")).to be(true)
      expect(@board.valid_coordinate?("D4")).to be(true)
      expect(@board.valid_coordinate?("A5")).to be(false)
      expect(@board.valid_coordinate?("E1")).to be(false)
      expect(@board.valid_coordinate?("A22")).to be(false)
    end
  end

  describe "valid placement" do
    it "can return if ship is a valid placement" do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be(false)
      expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(false)
    end
  end
end