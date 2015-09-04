# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Line
      include Virtus.model
      attribute :agencies, Array[Agency]
      attribute :name, String
      attribute :short_name, String
      attribute :vehicle, Vehicle
      attribute :color, String
      attribute :text_color, String
    end
  end
end
