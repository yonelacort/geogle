describe Geogle::Geocoder do
  describe 'searching by address' do
    let(:settings) { {} }
    let(:places) do
      VCR.use_cassette('geocode_by_address') do
        described_class.new(settings).address('Valencia', { country: 'ES' })
      end
    end

    it "returns an array" do
      expect(places).to be_kind_of(Array)
    end

    it "each element is Geogle::Model::Place" do
      expect(places.first).to be_kind_of(Geogle::Model::Place)
    end

    context "when raw is set to true" do
      let(:settings) { { raw: true } }

      it "returns the raw results in the body in JSON format" do
        expect(places).to be_kind_of(Array)
        expect(places.first).to include("geometry")
      end
    end
  end

  describe 'searching with a non-default locale' do
    let(:places) do
      VCR.use_cassette('geocode_by_address_DE') do
        described_class.new(language: "de").address('Berlin', { country: 'DE' })
      end
    end

    it "returns an array" do
      expect(places).to be_kind_of(Array)
    end

    it "each element is Geogle::Model::Place" do
        expect(places.first).to be_kind_of(Geogle::Model::Place)
      end
  end

  describe 'searching by latlng' do
    let(:places) do
      VCR.use_cassette('geocode_by_latlng') do
        described_class.new.latlng(39.4699075, -0.3762881)
      end
    end

    it "returns an array" do
      expect(places).to be_kind_of(Array)
    end

    describe "when the error handler raises an error RequestDeniedError" do
      before do
        allow(Geogle::ErrorHandler).to receive(:check) { raise Geogle::RequestDeniedError }
      end

      it "an exception is raised" do
        expect{ places }.to raise_error(Geogle::RequestDeniedError)
      end
    end
  end

  describe "when using non-valid business credentials" do
    let(:places) do
      VCR.use_cassette('geocode_by_latlng_invalid_business') do
        geocoder = described_class.new(client_id: "gme-foo", crypto_key: "bar")
        geocoder.latlng(39.4699075, -0.3762881)
      end
    end

    it "an exception InvalidKeyError is raised" do
      expect{ places }.to raise_error(Geogle::InvalidKeyError)
    end
  end
end