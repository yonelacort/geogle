# encoding: UTF-8

require 'virtus'
require_relative 'address'
require_relative 'geometry'

module Geogle
  module Model
    class Places
      include Virtus.model

      attribute :places, Array[Place]

      def method_missing(method, &block)
        if method.to_s =~ /^type_(.+)$/
          place_type($1)
        else
          super
        end
      end

      private

      def place_type(method)
        places.each do |place|
          return place if place.send("is_#{method}?")
        end
        nil
      end

    end
  end
end
