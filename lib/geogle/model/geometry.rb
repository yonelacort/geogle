# encoding: UTF-8

require 'virtus'
require_relative 'area'
require_relative 'coordinates'

module Geogle
  module Model
    class Geometry
      include Virtus.model

      attribute :location,      Coordinates
      attribute :location_type, String
      attribute :bounds,        Area
      attribute :viewport,      Area
    end
  end
end
