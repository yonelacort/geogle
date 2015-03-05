describe Geogle::Model::Line do
  let(:params) do
    {
      "agencies"=>[{"name"=>"RATP - SNCF"}],
      "color"=>"#c5a3cc",
      "short_name"=>"8",
      "text_color"=>"#000000",
      "vehicle"=>{}
    }
  end

  let(:line) { described_class.new(params) }

  it "has a short_name" do
    expect(line.short_name).to eq("8")
  end

  it "has a color" do
    expect(line.color).to eq("#c5a3cc")
  end

  it "has text color" do
    expect(line.text_color).to eq("#000000")
  end
end