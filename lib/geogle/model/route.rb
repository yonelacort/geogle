# encoding: UTF-8

require 'virtus'
require 'geogle/model/leg'
require 'geogle/model/area'

module Geogle
  module Model

    class Route
      include Virtus.model

      attribute :summary,           String
      attribute :legs,              Array[Leg] # Note: for Google directions without waypoints there is always a single leg.
      attribute :waypoint_order,    Array[Integer]
      attribute :overview_polyline, String
      attribute :bounds,            Area
      attribute :copyrights,        String
      attribute :warnings,          Array[String]

      # Total duration
      def duration
        sum_values(legs.map(&:duration))
      end

      # Total duration in traffic
      def duration_in_traffic
        sum_values(legs.map do |leg|
          leg.duration_in_traffic.nil? ? leg.duration : leg.duration_in_traffic
        end)
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

      def steps
        legs.map(&:steps).flatten
      end

      # Array of points that represents the entire path
      def path
        coordinates = steps.map(&:start_location)
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
