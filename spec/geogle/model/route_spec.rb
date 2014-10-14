module Geogle::Model
  describe Route do
    def text_value(value)
      TextValue.new(value: value)
    end

    def step(start_location, end_location)
      Step.new(
        start_location: start_location,
        end_location: end_location
      )
    end

    def coordinates(lat, lng)
      Coordinates.new(lat: lat, lng: lng)
    end

    let(:step1) { step(coordinates(51, 20), coordinates(52, 20)) }
    let(:step2) { step(coordinates(52, 21), coordinates(53, 21)) }
    let(:step3) { step(coordinates(53, 21), coordinates(53, 22)) }
    let(:step4) { step(coordinates(53, 22), coordinates(54, 22)) }

    let(:leg1) do
      Leg.new(
        duration: text_value(10),
        distance: text_value(20),
        start_address: "Earth",
        steps: [step1, step2]
      )
    end
    let(:leg2) do
      Leg.new(
        duration: text_value(20),
        distance: text_value(30),
        end_address: "Moon",
        steps: [step3, step4]
      )
    end
    let(:legs)   { [leg1, leg2] }
    let(:route)  { described_class.new(legs: legs)}

    it "duration adds the durations of all legs" do
      expect(route.duration).to eq(30)
    end

    it "distance adds the distances of all legs" do
      expect(route.distance).to eq(50)
    end

    it "origin returns the start_address of the first leg" do
      expect(route.origin).to eq("Earth")
    end

    it "destination returns the end_address of the last leg" do
      expect(route.destination).to eq("Moon")
    end

    describe "path" do
      it "there's one more point than steps exists" do
        expect(route.path.count).to eq(5)
      end

      it "the origin point matches with start_location of the first step" do
        expect(route.path.first).to eq(step1.start_location)
      end

      it "the destination point with the end_location of the last step" do
        expect(route.path.last).to eq(step4.end_location)
      end
    end
  end
end