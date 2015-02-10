# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Line
      include Virtus.model

      attribute :agencies, Array[Agency]
      attribute :short_name, String
      attribute :vehicle, Vehicle
    end
  end
end
