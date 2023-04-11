require "./lib/ship"
require "./lib/cell"
require "./lib/board"

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    end
  
    it "can check if coordinates are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
    end

    it "checks for diagonal coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)
    end

    it "checks more valid placements" do
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be(true)
    end
  end

  describe "placing ships" do
    it "can place ships" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]
      expect(cell_1.ship).to eq(@cruiser)
      expect(cell_2.ship).to eq(@cruiser)
      expect(cell_3.ship).to eq(@cruiser)
      expect(cell_3.ship == cell_2.ship).to be(true)
    end

    it "checks for overlap placements" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe "render board" do
    it "can render the board" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      @board.render
      @board.render(true)
    end
  end
end