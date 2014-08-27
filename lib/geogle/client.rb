# encoding: UTF-8

require "faraday"
require "json"

module Geogle
  class Client
    def initialize(args = {})
      @args        = args
      @parametizer = Parametizer.new(args)
      @conn        = Faraday.new
    end

    def address(address, components = {})
      request(@parametizer.address(address, components))
    end

    def latlng(lat, lng)
      request(@parametizer.latlng(lat, lng))
    end

    private

    def request(params)
      response = @conn.get(UrlBuilder.new(@args).build(params))
      body = JSON.parse(response.body)
      ErrorHandler.check(body['status'])
      Parser.places(body["results"])
    end
  end
end
