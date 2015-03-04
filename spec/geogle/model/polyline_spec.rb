module Geogle::Model
  describe Polyline do
    let(:encoded) { "_p~iF~ps|U_ulLnnqC_mqNvxq`@" }

    let(:line) { described_class.new(points: encoded) }

    it "has original points" do
      expect(line.points).to eq(encoded)
    end

    describe "decoded_points" do

      let(:points) { line.decoded_points }

      it "returns the same ammount of points" do
        expect(points.count).to eq(3)
      end

      it "creates coordinates from original points" do
        expect(points.first.to_s).to eq("38.5,-120.2")
      end
    end
  end
end