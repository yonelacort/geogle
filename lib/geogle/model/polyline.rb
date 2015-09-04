# encoding: UTF-8

require 'geogle/model/coordinates'
require 'polylines'

module Geogle
  module Model

    class Polyline
      include Virtus.model

      attribute :points

      def decoded_points
        @decoded ||= begin
          Polylines::Decoder.decode_polyline(points).map do |p|
            Coordinates.new(lat: p[0], lng: p[1])
          end
        end
      end
    end
  end
end
