describe 'Parser' do

    describe "places" do
      let(:places) do
        VCR.use_cassette('geocode_by_latlng') do
          Geogle::Geocoder.new.latlng(39.4699075, -0.3762881)
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

    describe 'routes' do
      let(:routes) do
        VCR.use_cassette('directions_by_address') do
          Geogle::Directions.new.search("Valencia", "Madrid", { region: "es" })
        end
      end

      it "returns an array" do
        expect(routes).to be_kind_of(Array)
      end

      it "each element is Geogle::Model::Route" do
        expect(routes.first).to be_kind_of(Geogle::Model::Route)
      end

      describe "route" do
        let(:route) { routes.first }

        it "summary" do
          expect(route.summary).to eq("A-3")
        end

        describe "overview_polyline" do
          pending
        end

        it "copyrights" do
          expect(route.copyrights).to eq("Map data ©2014 Google, basado en BCN IGN España")
        end

        describe "warnings" do
          pending
        end

        it "waypoint_order" do
          pending
          expect(route.waypoint_order).to be_kind_of([])
        end

        describe "bounds" do
          let(:bounds) { route.bounds }

          describe "southwest" do
            let(:southwest) { bounds.southwest }

            it "has latitude" do
              expect(southwest.lat).to eq(39.4289182)
            end

            it "has longitude" do
              expect(southwest.lng).to eq(-3.7046622)
            end
          end

          describe "northeast" do
            let(:northeast) { bounds.northeast }

            it "has latitude" do
              expect(northeast.lat).to eq(40.4167158)
            end

            it "has longitude" do
              expect(northeast.lng).to eq(-0.3759178)
            end
          end
        end

        describe "legs" do
          let(:leg) { route.legs.first }

          it "is an array" do
            expect(route.legs).to be_kind_of(Array)
          end

          it "start_address" do
            expect(leg.start_address).to eq("Valencia, Valencia, Spain")
          end

          it "end_address" do
            expect(leg.end_address).to eq("Madrid, Madrid, Spain")
          end

          it "start_location" do
            expect(leg.start_location.to_s).to eq("39.4699889,-0.3759178")
          end

          it "end_location" do
            expect(leg.end_location.to_s).to eq("40.4167158,-3.7037799")
          end

          describe "distance" do
            let(:distance) { leg.distance }

            it "value" do
              expect(distance.value).to eq(355097)
            end

            it "text" do
              expect(distance.text).to eq("355 km")
            end
          end

          describe "duration" do
            let(:duration) { leg.duration }

            it "value" do
              expect(duration.value).to eq(11866)
            end

            it "text" do
              expect(duration.text).to eq("3 hours 18 mins")
            end
          end

          describe "arrival_time" do
            let(:arrival_time) { leg.arrival_time }
            pending
          end

          describe "departure_time" do
            let(:departure_time) { leg.departure_time }
            pending
          end

          describe "steps" do
            let(:step) { leg.steps.first }

            it "is an array" do
              expect(route.legs).to be_kind_of(Array)
            end

            it "html_instructions" do
              expect(step.html_instructions).to eq("Head <b>north</b> on <b>Plaça de l'Ajuntament</b>")
            end

            it "travel_mode" do
              expect(step.travel_mode).to eq("DRIVING")
            end

            it "start_location" do
              expect(step.start_location.to_s).to eq("39.4699889,-0.3759178")
            end

            it "end_location" do
              expect(step.end_location.to_s).to eq("39.4701816,-0.3759889")
            end

            describe "distance" do
              it "value" do
                expect(step.distance.value).to eq(22)
              end

              it "text" do
                expect(step.distance.text).to eq("22 m")
              end
            end

            describe "duration" do
              it "value" do
                expect(step.duration.value).to eq(2)
              end

              it "text" do
                expect(step.duration.text).to eq("1 min")
              end
            end
          end
        end
      end
    end
  end