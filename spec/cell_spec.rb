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

end