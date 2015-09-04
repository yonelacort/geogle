# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Vehicle
      include Virtus.model

      attribute :icon,       String
      attribute :local_icon, String
      attribute :name,       String
      attribute :type,       String
    end
  end
end
