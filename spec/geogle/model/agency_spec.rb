describe Geogle::Model::Agency do
  let(:params) do
    {
      name: "agency name",
      phone: "011 49 123.456",
      url: "http://agency.org"
    }
  end

  let(:agency) { described_class.new(params) }

  it "has a duration" do
    expect(agency.name).to eq("agency name")
  end

  it "has a phone" do
    expect(agency.phone).to eq("011 49 123.456")
  end

  it "has an url" do
    expect(agency.url).to eq("http://agency.org")
  end
end