# Geogle

Still in development. Ruby wrapper for the Geocoding service provided from the Google Maps API.


Documentation
https://developers.google.com/maps/documentation/geocoding/


## Installation

Add this line to your application's Gemfile:

    gem 'geogle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geogle

## Usage

When creating the Geogle::Client instance you can pass:

* sensor: true or false (false by default)
* language: ("en" by default).

In case you wanna use Google Maps API for Business, you'll need to pass the following attributes in order to sign the URL.
* client_id: ID of the client. It starts with "gme-" prefix.
* crypto_key: Criptographic key.

Here's more information about Google Maps API for Business:
https://developers.google.com/maps/documentation/business/webservices

# Geocode by address with non-Business account
----------------------------------------------

  $ client = Geogle::Client.new({ sensor: false, language: "es" })
  $ client.address("Blasco Ibañez, Valencia")

# Geocode by address making use of the components
-------------------------------------------------

  $ client = Geogle::Client.new({ sensor: false, language: "es" })
  $ components = { country: 'ES' }
  $ client.address("Blasco Ibañez, Valencia", components)

  Available components to be used can be found here:
  https://developers.google.com/maps/documentation/geocoding/#ComponentFiltering

# Reverse geocode by geo-coordinates with Business account
----------------------------------------------------------

  $ client = Geogle::Client.new({ client_id: "gme-client-id", crypto_key: "8as-vURkasdasd" })
  $ Geogle::Client.new.latlng(39.5073225, -0.2914778)

  The signature required to do the request will be included in the URL.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
