# encoding: UTF-8

module Geogle
  class Parametizer
    def initialize(params = {})
      @sensor   = params[:sensor]   || false
      @language = params[:language] || "en"
    end

    def address(address, components = {})
      options = {
        address:    address,
        language:   @language,
        components: components(components),
        sensor:     @sensor
      }
      compact_hash(options)
    end

    def latlng(lat, lng)
      {
        latlng:   "#{lat},#{lng}",
        language: @language,
        sensor:   @sensor
      }
    end

    def directions(origin, destination, params)
      waypoints = params[:waypoints] || []
      params.merge!(
        origin:         origin,
        destination:    destination,
        mode:           params[:mode] || "driving",
        waypoints:      waypoints.join("|"),
        sensor: @sensor,
        language: @language

        )
      compact_hash(params)
    end

    private

    def compact_hash(hash)
      hash.select { |k,v| !v.nil? && !v.to_s.empty? }
    end

    def components(components)
      components.collect do |component, value|
        "#{component}:#{value}"
      end.join('|')
    end
  end
end
