# encoding: UTF-8

module Geogle
  class Parametizer
    def initialize(params = {})
      @sensor   = params[:sensor]   || false
      @language = params[:language] || "en"
    end

    def address(address, components = {})
      options = { }
      options[:address]    = address
      options[:language]   = @language
      options[:components] = components(components) unless components.empty?
      options[:sensor]     = @sensor
      options
    end

    def latlng(lat, lng)
      { latlng: "#{lat},#{lng}", language: @language, sensor: @sensor }
    end

    private

    def components(components)
      components.collect do |component, value|
        "#{component}:#{value}"
      end.join('|')
    end
  end
end
