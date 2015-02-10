describe Geogle::Model::Vehicle do
  let(:params) do
    {
      icon: "icon.png",
      local_icon: "local_icon.png",
      name: "M12",
      type: "TRAM"
    }
  end

  let(:vehicle) { described_class.new(params) }

  it "has a icon" do
    expect(vehicle.icon).to eq("icon.png")
  end

  it "has a local icon" do
    expect(vehicle.local_icon).to eq("local_icon.png")
  end

  it "has a type" do
    expect(vehicle.type).to eq("TRAM")
  end

  it "has a name" do
    expect(vehicle.name).to eq("M12")
  end
end