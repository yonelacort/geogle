# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Coordinates
      include Virtus.model

      attribute :lat, Float
      attribute :lng, Float

      def to_s
        "#{lat},#{lng}"
      end
    end
  end
end
