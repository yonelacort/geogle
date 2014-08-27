# encoding: UTF-8

require 'virtus'
require_relative 'coordinates'

module Geogle
  module Model
    class Area
      include Virtus.model

      attribute :northeast, Coordinates
      attribute :southwest, Coordinates
    end
  end
end
