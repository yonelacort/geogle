# encoding: UTF-8

require 'virtus'

module Geogle
  module Model
    class Agency
      include Virtus.model

      attribute :name,  String
      attribute :phone, String
      attribute :url,   String
    end
  end
end
