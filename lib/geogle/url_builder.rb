# encoding: UTF-8

require 'base64'
require 'uri'
require 'hmac'
require 'hmac-sha1'

module Geogle
  class UrlBuilder
    BASE           = "https://maps.googleapis.com"
    GEOCODE_URL    = "#{BASE}/maps/api/geocode/json"

    def initialize(params = {})
      @client_id  = params[:client_id]
      @crypto_key = params[:crypto_key]
    end

    def build(params)
      uri = URI(GEOCODE_URL)
      uri.query = URI.encode_www_form(params)
      uri
    end

    # TODO: Sign url for business
  end
end
