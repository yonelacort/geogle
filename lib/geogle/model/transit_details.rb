# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class TransitDetails
      include Virtus.model

      attribute :arrival_stop, Stop
      attribute :departure_stop, Stop
      attribute :headsign, String
      attribute :line, Line
      attribute :num_stops, Integer


      def initialize(args)
        @arrival_time = args["arrival_time"]
        @departure_time = args["departure_time"]
        super(args)
      end

      def arrival_time
        ::Time.at @arrival_time["value"]
      end

      def departure_time
        ::Time.at @departure_time["value"]
      end

    end
  end
end
