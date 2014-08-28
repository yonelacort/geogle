# encoding: UTF-8

require 'virtus'
require 'geogle/model/coordinates'

module Geogle
  module Model
    class Area
      include Virtus.model

      attribute :northeast, Coordinates
      attribute :southwest, Coordinates
    end
  end
end
