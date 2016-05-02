describe Geogle::UrlBuilder do
  let(:uri)       { "https://www.foo.com" }
  let(:builder)   { described_class.new(uri, attrs)}
  let(:params) do
    {
      address: "Street FooBar",
      language: "de",
      sensor:  true
    }
  end
  let(:built_url) { builder.build(params) }

  describe "when the client_id and crypto_key are not passed as arguments" do
    let(:attrs) { {} }

    it "the built url doesn't contain a query param signature" do
      expect(built_url.to_s).to eq("https://www.foo.com?address=Street+FooBar&language=de&sensor=true")
    end
  end

  describe "when the key is passed as argument" do
    let(:attrs) { { key: "123njsdfjahs" } }

    it "the built url includes the key" do
      expect(built_url.to_s).to eq("https://www.foo.com?address=Street+FooBar&language=de&sensor=true&key=123njsdfjahs")
    end
  end

  describe "when the client_id and crypto_key are passed as arguments" do
    let(:attrs) do
      {
        client_id:  "gme-clientid",
        crypto_key: "crypto-key"
      }
    end

    it "the built url contains a query param signature" do
      expect(built_url.to_s).to eq("https://www.foo.com?client=gme-clientid&address=Street+FooBar&language=de&sensor=true&signature=1klekRivPNXr3vOpOixX16LNGuI=")
    end
  end

  describe "when the client_id, crypto_key and key are passed as arguments" do
    let(:attrs) do
      {
        key:        "123njsdfjahs",
        client_id:  "gme-clientid",
        crypto_key: "crypto-key"
      }
    end

    it "the built url contains a query param signature" do
      expect(built_url.to_s).to eq("https://www.foo.com?client=gme-clientid&address=Street+FooBar&language=de&sensor=true&signature=1klekRivPNXr3vOpOixX16LNGuI=")
    end
  end
end
