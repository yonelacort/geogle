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

      # Total duration
      def duration
        sum_values(legs.map(&:duration))
      end

      # Total distance
      def distance
        sum_values(legs.map(&:distance))
      end

      # Name of starting address
      def origin
        legs.first.start_address
      end

      # Name of destination address
      def destination
        legs.last.end_address
      end

      # Array of points that represents the entire path
      def path
        coordinates = legs.map(&:steps).flatten.map(&:start_location)
        coordinates << legs.last.steps.last.end_location
        coordinates
      end

      private

      def sum_values(values)
        values.map(&:value).inject(:+)
      end
    end
  end
end
