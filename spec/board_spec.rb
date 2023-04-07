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
end