# encoding: UTF-8

require 'virtus'
require 'geogle/model/area'
require 'geogle/model/coordinates'

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
