# encoding: UTF-8

require "faraday"
require "json"

module Geogle
  class Base
    def initialize(args = {})
      @args        = args
      @parametizer = Parametizer.new(args)
      @conn        = Faraday.new
    end

    protected

    def request(url, params)
      response = @conn.get(UrlBuilder.new(url, @args).build(params))
      body = JSON.parse(response.body)
      ErrorHandler.check(body['status'])
      body
    end
  end
end
