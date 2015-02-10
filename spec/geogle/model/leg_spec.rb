describe Geogle::Model::Leg do
  let(:leg) do
    described_class.new({
      duration: {text: "duration", value: 11756},
      distance: {text: "distance", value: 355055},
      start_address: "Valencia, Valencia, Spain",
      end_address: "Madrid, Madrid, Spain"
    } )
  end

  it "duration" do
    expect(leg.duration.value).to eq(11756)
  end

  it "distance" do
    expect(leg.distance.value).to eq(355055)
  end

  it "origin" do
    expect(leg.start_address).to eq("Valencia, Valencia, Spain")
  end

  it "destination" do
    expect(leg.end_address).to eq("Madrid, Madrid, Spain")
  end
end