# encoding: UTF-8

require "json"
require "net/http"

module Geogle
  class Base
    def initialize(settings = {})
      @settings    = settings
      @parametizer = Parametizer.new(settings)
      @raw         = settings[:raw] || false
    end

    protected

    def request(url, params)
      uri = UrlBuilder.new(url, @settings).build(params)
      response = Net::HTTP.get_response(uri)
      raise InvalidKeyError if response.code == "403"
      body = JSON.parse(response.body)
      # puts "#{params[:origin]}_to_#{params[:destination]}"
      # puts " "
      # File.open("fixtures/#{params[:origin]}_to_#{params[:destination]}.json", 'w'){ |f| f.write(response.body)}
      ErrorHandler.check(body['status'])
      body
    end
  end
end
