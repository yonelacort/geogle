# encoding: UTF-8

require 'virtus'

module Geogle
  module Model

    class TextValue
      include Virtus.model

      attribute :text,  String
      attribute :value, Integer
    end
  end
end
