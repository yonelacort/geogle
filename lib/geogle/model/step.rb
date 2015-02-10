# encoding: UTF-8

require 'virtus'
require 'geogle/model/coordinates'
require 'geogle/model/text_value'

module Geogle
  module Model

    class Step
      include Virtus.model

      attribute :html_instructions, String
      attribute :distance,          TextValue
      attribute :duration,          TextValue
      attribute :start_location,    Coordinates
      attribute :end_location,      Coordinates
      attribute :travel_mode,       String
      attribute :polyline,          Hash
      # Only when travel_mode is transit
      # attribute :sub_steps,         String
      attribute :transit_details,   TransitDetails
    end
  end
end
