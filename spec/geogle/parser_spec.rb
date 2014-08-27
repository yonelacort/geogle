describe 'Parser' do
    let(:places) do
      VCR.use_cassette('geocode_by_latlng') do
        Geogle::Client.new.latlng(39.4699075, -0.3762881)
      end
    end

    it "returns an array of Geogle::Model::Places" do
      expect(places).to be_kind_of(Array)
    end

    it "each element is Geogle::Model::Place" do
      expect(places.first).to be_kind_of(Geogle::Model::Place)
    end

    describe "place" do
      let(:place) { places.first }

      it "geo_location" do
        expect(place.geo_location.to_s).to eq("39.4701016,-0.3761823")
      end

      it "street" do
        expect(place.street).to eq("Plaza Ayuntamiento")
      end

      it "locality" do
        expect(place.locality).to eq("Valencia")
      end

      it "city" do
        expect(place.city).to eq("Valencia")
      end

      it "state" do
        expect(place.state).to eq("Valencian Community")
      end

      it "country" do
        expect(place.country).to eq("Spain")
      end

      it "country_code" do
        expect(place.country_code).to eq("ES")
      end

      describe "geometry" do
        let(:geometry) { place.geometry }

        it "location_type" do
          expect(geometry.location_type).to eq("ROOFTOP")
        end

        describe "location" do
          let(:location) { geometry.location }

          it "has latitude" do
            expect(location.lat).to eq(39.4701016)
          end

          it "has longitude" do
            expect(location.lng).to eq(-0.3761823)
          end

          it "to_s" do
            expect(location.to_s).to eq("39.4701016,-0.3761823")
          end
        end

        describe "bounds" do
          let(:bounds) { geometry.bounds }

          it "they are nil when there are not" do
            expect(bounds).to be_nil
          end
        end

        describe "viewport" do
          let(:viewport) { geometry.viewport }

          describe "southwest" do
            let(:southwest) { viewport.southwest }

            it "has latitude" do
              expect(southwest.lat).to eq(39.4687526197085)
            end

            it "has longitude" do
              expect(southwest.lng).to eq(-0.3775312802915021)
            end
          end

          describe "northeast" do
            let(:northeast) { viewport.northeast }

            it "has latitude" do
              expect(northeast.lat).to eq(39.4714505802915)
            end

            it "has longitude" do
              expect(northeast.lng).to eq(-0.374833319708498)
            end
          end
        end
      end

      describe "address" do
        let(:address) { place.address }

        it "has a street_number" do
          expect(address.street_number).to eq("S/N")
        end

        it "has a street" do
          expect(address.street).to eq("Plaza Ayuntamiento")
        end

        it "has a locality" do
          expect(address.locality).to eq("Valencia")
        end

        it "has a area_level_1" do
          expect(address.area_level_1).to eq("Valencian Community")
        end

        it "has a area_level_1_code" do
          expect(address.area_level_1_code).to eq("Valencian Community")
        end

        it "has a area_level_2" do
          expect(address.area_level_2).to eq("Valencia")
        end

        it "has a area_level_2_code" do
          expect(address.area_level_2_code).to eq("V")
        end

        it "has a country" do
          expect(address.country).to eq("Spain")
        end

        it "has a country_code" do
          expect(address.country_code).to eq("ES")
        end

        it "has a formatted" do
          expect(address.formatted).to eq("Plaza Ayuntamiento, S/N, 46002 Valencia, Valencia, Spain")
        end
      end
    end
  end