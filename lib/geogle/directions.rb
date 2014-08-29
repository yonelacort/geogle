# encoding: UTF-8

module Geogle
  class Directions < Base
    def routes(origin, destination, options = {})
      params = @parametizer.directions(origin, destination, options)
      body = request(URL::DIRECTIONS, params)
      Parser.routes(body["routes"])
    end
  end
end
