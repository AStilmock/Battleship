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
      expect(@cruiser).to be_an_instance_of(Ship)
    end
  end

end