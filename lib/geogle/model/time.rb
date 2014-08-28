# encoding: UTF-8

require 'virtus'

module Geogle
  module Model

    class Time
      include Virtus.model

      attribute :text,      String
      attribute :value,     Integer
      attribute :time_zone, String
    end
  end
end
