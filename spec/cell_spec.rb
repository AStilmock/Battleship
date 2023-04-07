require "./lib/ship"
require "./lib/cell"

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end
  
  describe "initialize" do
    it "exists" do
      expect(@cell).to be_an_instance_of(Cell)
    end

    it "checks cell data" do
      expect(@cell.coordinate).to eq("B4")
      expect(@cell.ship).to eq(nil)
      expect(@cell.empty?).to eq(true)
    end
  end

  describe "checks ship data" do
    it "exists" do
      expect(@cruiser).to be_an_instance_of(Ship)
    end
    it "places a ship" do
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  describe "firing at cells" do
    it "fires on a ship" do
      @cell.place_ship(@cruiser)
      expect(@cell.fired_upon?).to eq(false)

      @cell.fire_upon
      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon?).to eq(true)
    end
  end

  describe "it can render" do
    it "exist" do
      expect(@cruiser).to be_an_instance_of(Ship)
    end
    it "renders spaces" do
      cell_1 = Cell.new("B4")
      expect(cell_1.render).to eq(".")
      cell_1.fire_upon
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      expect(cell_2.render).to eq(".")
      expect(cell_2.render(true)).to eq("S")
    end
    it "can render a sinked ship" do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon
      expect(cell_2.render).to eq("H")
      expect(cruiser.sunk?).to eq(false)
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
      require 'pry'; binding.pry
    end
  end
end