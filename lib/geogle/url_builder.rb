# encoding: UTF-8

require 'base64'
require 'uri'
require 'hmac'
require 'hmac-sha1'

module Geogle
  class UrlBuilder
    def initialize(url, params = {})
      @url        = url
      @client_id  = params[:client_id]
      @crypto_key = params[:crypto_key]
    end

    def build(params)
      uri = URI(@url)
      uri.query = URI.encode_www_form(params)
      return sign(uri) if is_business?
      uri
    end

    private

    def sign(url)
      url_to_sign = "#{url.path}?client=#{@client_id}&#{url.query}"
      raw_key = url_safe_base64_decode(@crypto_key)

      # create a signature using the cryptographic key and the URL
      sha1 = HMAC::SHA1.new(raw_key)
      sha1 << url_to_sign
      raw_signature = sha1.digest()

      # encode the signature into base64 for url use form.
      signature =  url_safe_base64_encode(raw_signature)
      url.scheme+"://"+ url.host + url_to_sign + "&signature=#{signature}"
    end

    def url_safe_base64_decode(base64_string)
      return Base64.decode64(base64_string.tr('-_','+/'))
    end

    def url_safe_base64_encode(raw)
      return Base64.encode64(raw).tr('+/','-_')
    end

    def is_business?
      @client_id && @crypto_key
    end
  end
end
