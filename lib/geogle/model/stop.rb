# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Stop
      include Virtus.model

      attribute :location,  Coordinates
      attribute :name, String
    end
  end
end
