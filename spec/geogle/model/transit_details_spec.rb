describe Geogle::Model::TransitDetails do
  let(:transit) do
    described_class.new({
      "arrival_time"    => { "value" => 1424347080 },
      "departure_time"  => { "value" => 1424346660 },
    } )
  end


  describe "arrival time" do
    it "is parsed from integer" do
      expect(transit.arrival_time.to_s).to eq("2015-02-19 12:58:00 +0100")
    end
  end

  describe "departure time" do
    it "is parsed from integer" do
      expect(transit.departure_time.to_s).to eq("2015-02-19 12:51:00 +0100")
    end
  end
end