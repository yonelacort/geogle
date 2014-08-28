# encoding: UTF-8

require 'virtus'
require 'geogle/model/step'
require 'geogle/model/time'
require 'geogle/model/text_value'
require 'geogle/model/coordinates'

module Geogle
  module Model

    class Leg
      include Virtus.model

      attribute :steps,          Array[Step]
      attribute :distance,       TextValue
      attribute :duration,       TextValue
      attribute :arrival_time,   Time
      attribute :departure_time, Time
      attribute :start_address,  String
      attribute :end_address,    String
      attribute :start_location, Coordinates
      attribute :end_location,   Coordinates
    end
  end
end
