# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class TransitDetails
      include Virtus.model

      attribute :arrival_stop, Stop
      attribute :arrival_time, Time
      attribute :departure_stop, Stop
      attribute :departure_time, Time
      attribute :headsign, String
      attribute :line, Line
      attribute :num_stops, Integer

    end
  end
end
