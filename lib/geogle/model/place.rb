# encoding: UTF-8

require 'virtus'
require_relative 'address'
require_relative 'geometry'

module Geogle
  module Model
    class Place
      include Virtus.model

      TYPES = %w(street_address
                 route political
                 country
                 administrative_area_level_1
                 administrative_area_level_2
                 administrative_area_level_3
                 colloquial_area
                 locality
                 sublocality
                 neighborhood
                 premise
                 subpremise
                 postal_code
                 natural_feature
                 airport
                 park
                 point_of_interest
                 post_box
                 street_number
                 floor
                 room)

      attribute :geometry, Geometry
      attribute :address,  Address

      def geo_location
        geometry.location
      end

      def street
        address.street
      end

      def locality
        address.locality
      end

      def city
        address.area_level_2
      end

      def state
        address.area_level_1
      end

      def country
        address.country
      end

      def country_code
        address.country_code
      end

      def method_missing(method, &block)
        if method.to_s =~ /^is_(.+?)?$/ && TYPES.include?(method)
          is_type?($1)
        else
          super
        end
      end

      private

      def is_type?(type)
        # TODO
      end

    end
  end
end
