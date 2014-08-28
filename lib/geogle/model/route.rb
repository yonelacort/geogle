# encoding: UTF-8

require 'virtus'
require 'geogle/model/leg'
require 'geogle/model/area'

module Geogle
  module Model

    class Route
      include Virtus.model

      attribute :summary,           String
      attribute :legs,              Array[Leg]
      attribute :waypoint_order,    Array[Integer]
      attribute :overview_polyline, String
      attribute :bounds,            Area
      attribute :copyrights,        String
      attribute :warnings,          Array[String]
    end
  end
end
