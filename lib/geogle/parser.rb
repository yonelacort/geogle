# encoding: UTF-8

module Geogle
  module Parser
    extend self

    def places(results)
      return [] if blank?(results)
      places = results.collect do |result|
        Parser.place(result)
      end
      Model::Places.new(places: places)
    end

    def place(place)
      Model::Place.new({
        address: address(place["address_components"], place["formatted_address"]),
        geometry: geometry(place["geometry"]),
      })
    end

    private

    def address(components, formatted_address)
      Model::Address.new({
        formatted:         formatted_address,
        street_number:     address_component(components, "long_name", "street_number"),
        street:            address_component(components, "long_name", "route"),
        locality:          address_component(components, "long_name", "locality"),
        area_level_1:      address_component(components, "long_name", "administrative_area_level_1"),
        area_level_1_code: address_component(components, "short_name", "administrative_area_level_1"),
        area_level_2:      address_component(components, "long_name", "administrative_area_level_2"),
        area_level_2_code: address_component(components, "short_name", "administrative_area_level_2"),
        country:           address_component(components, "long_name", "country"),
        country_code:      address_component(components, "short_name", "country"),
      })
    end

    def geometry(geometry)
      return nil if blank?(geometry)
      Model::Geometry.new({
        location:      coordinates(geometry["location"]),
        location_type: geometry["location_type"],
        bounds:        area(geometry["bounds"]),
        viewport:      area(geometry["viewport"]),
      })
    end

    def coordinates(coordinates)
      return nil if blank?(coordinates)
      Model::Coordinates.new({
        lat: coordinates["lat"],
        lng: coordinates["lng"],
      })
    end

    def area(area)
      return nil if blank?(area)
      Model::Area.new({
        northeast: coordinates(area["northeast"]),
        southwest: coordinates(area["southwest"]),
      })
    end

    def address_component(address_components, short_or_long_name, type)
      address_components.each do |address_component|
        if address_component["types"].include?(type)
          return address_component[short_or_long_name]
        end
      end
      nil
    end

    def blank?(attrs)
      attrs.nil? || attrs.empty?
    end
  end
end
