# encoding: UTF-8

module Geogle
  class Error < StandardError;end

  class BadRequestError < Error; end
  class RequestDeniedError < Error; end
  class OverQueryError < Error; end
  class InvalidKeyError  < Error; end
end