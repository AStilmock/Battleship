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
end