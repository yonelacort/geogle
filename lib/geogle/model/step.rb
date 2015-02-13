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
      attribute :steps,             [Step]
      attribute :transit_details,   TransitDetails

      def sub_steps
        steps
      end
    end
  end
end
