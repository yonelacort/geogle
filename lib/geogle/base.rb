# encoding: UTF-8

require "json"
require "net/http"

module Geogle
  class Base
    def initialize(args = {})
      @args        = args
      @parametizer = Parametizer.new(args)
    end

    protected

    def request(url, params)
      uri = UrlBuilder.new(url, @args).build(params)
      response = Net::HTTP.get_response(uri)
      raise InvalidKeyError if response.code == "403"
      body = JSON.parse(response.body)
      ErrorHandler.check(body['status'])
      body
    end
  end
end
