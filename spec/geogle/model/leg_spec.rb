describe Geogle::Model::Leg do
  let(:route) do
    VCR.use_cassette('directions_by_address') do
      Geogle::Directions.new.routes("Valencia", "Madrid", { region: "es" }).first
    end
  end

  it "duration" do
    expect(route.duration).to eq(12745)
  end

  it "distance" do
    expect(route.distance).to eq(355040)
  end

  it "origin" do
    expect(route.origin).to eq("Valencia, Valencia, Spain")
  end

  it "destination" do
    expect(route.destination).to eq("Madrid, Madrid, Spain")
  end
end