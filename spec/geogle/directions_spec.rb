describe Geogle::Directions do
  describe 'searching by address' do
    let(:routes) do
      VCR.use_cassette('directions_by_address') do
        described_class.new.search("Valencia", "Madrid", { region: "es" })
      end
    end

    it "returns an array" do
      expect(routes).to be_kind_of(Array)
    end

    it "each element is Geogle::Model::Route" do
      expect(routes.first).to be_kind_of(Geogle::Model::Route)
    end
  end

  describe 'searching by geo-location' do
    let(:routes) do
      VCR.use_cassette('directions_by_latlng') do
        described_class.new.search("39.4699889,-0.3759178", "40.4167158,-3.7037799", { region: "es" })
      end
    end

    it "returns an array" do
      expect(routes).to be_kind_of(Array)
    end

    it "each element is Geogle::Model::Route" do
      expect(routes.first).to be_kind_of(Geogle::Model::Route)
    end
  end

  describe 'searching by address and no results' do
    let(:routes) do
      VCR.use_cassette('directions_by_address_no_results') do
        described_class.new.search("Valencia", "New york")
      end
    end

    it "returns an array" do
      expect(routes).to be_kind_of(Array)
    end

    it "the array is empty" do
      expect(routes).to be_empty
    end
  end
end
