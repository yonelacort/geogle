# encoding: UTF-8

module Geogle
  class Geocoder < Base
    def address(address, components = {})
      executor(:address, address, components)
    end

    def latlng(lat, lng)
      executor(:latlng, lat, lng)
    end

    private

    def executor(method, arg1, arg2)
      body = request(URL::GEOCODE, @parametizer.send(method, arg1, arg2))
      Parser.places(body["results"])
    end
  end
end
