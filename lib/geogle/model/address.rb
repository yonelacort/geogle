# encoding: UTF-8

require 'virtus'

module Geogle
  module Model

    class Address
      include Virtus.model

      attribute :street_number,     String
      attribute :street,            String
      attribute :locality,          String
      attribute :area_level_1,      String
      attribute :area_level_1_code, String
      attribute :area_level_2,      String
      attribute :area_level_2_code, String
      attribute :country,           String
      attribute :country_code,      String
      attribute :formatted,         String
    end

  end
end
