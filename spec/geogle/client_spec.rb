describe Geogle::Client do
  describe 'searching by address' do
    let(:places) do
      VCR.use_cassette('geocode_by_address') do
        Geogle::Client.new.address('Valencia', { country: 'ES' })
      end
    end

    it "returns an array" do
      expect(places).to be_kind_of(Array)
    end
  end

  describe 'searching by latlng' do
    let(:places) do
      VCR.use_cassette('geocode_by_latlng') do
        Geogle::Client.new.latlng(39.4699075, -0.3762881)
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
end