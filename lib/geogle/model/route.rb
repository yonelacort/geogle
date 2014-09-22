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

      def duration
        sum_values(legs.map(&:duration))
      end

      def distance
        sum_values(legs.map(&:distance))
      end

      def origin
        legs.first.start_address
      end

      def destination
        legs.last.end_address
      end

      private

      def sum_values(values)
        values.map(&:value).inject(:+) { |sum, value| value }
      end
    end
  end
end
