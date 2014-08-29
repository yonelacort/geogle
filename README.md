# Geogle

Ruby wrapper for the Geocoding and Directions services provided from the Google Maps API.

[![wercker status](https://app.wercker.com/status/6122e4f0966ee255949e2eb465aefd10/m "wercker status")](https://app.wercker.com/project/bykey/6122e4f0966ee255949e2eb465aefd10)
[![Gem Version](https://badge.fury.io/rb/geogle.svg)](http://badge.fury.io/rb/geogle)

## Installation

Add this line to your application's Gemfile:

    gem 'geogle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geogle

## Usage

### Geocoding
Google geocoding documentation:
https://developers.google.com/maps/documentation/geocoding/

When creating the Geogle::Geocoder instance you can pass:

* **sensor**: true or false (false by default)
* **language**: ("en" by default).

In case you wanna use Google Maps API for Business, you'll need to pass the following attributes in order to sign the URL.
* **client_id**: ID of the client. It starts with "gme-" prefix.
* **crypto_key**: Criptographic key.

Here's more information about Google Maps API for Business:
https://developers.google.com/maps/documentation/business/webservices

There are two methods that can be called:
* **address**: Geocoding by name of the location.
* **latlng**:  Reverse geocode.

Both methods return an array of Geogle::Model::Place. Each place is composed by:
* **geometry**:
    * **location**:
        * **lat**: Float
        * **lng**: Float
    * **location_type**: String
    * **bounds**:
        * **northeast**:
            * **lat**: Float
            * **lng**: Float
        * **southwest**:
            * **lat**: Float
            * **lng**: Float
    * **viewport**:
        * **northeast**:
            * **lat**: Float
            * **lng**: Float
        * **southwest**:
            * **lat**: Float
            * **lng**: Float
* **address**:
    * **street_number**: String
    * **street**: String
    * **locality**: String
    * **area_level_1**: String
    * **area_level_1_code**: String
    * **area_level_2**: String
    * **area_level_2_code**: String
    * **country**: String
    * **country_code**: String
    * **formatted**: String


### By address without an account

```ruby
client = Geogle::Geocoder.new({ sensor: false, language: "es" })
client.address("Blasco Ibañez, Valencia")
```

### By address making use of the components

```ruby
client = Geogle::Geocoder.new({ sensor: false, language: "es" })
components = { country: 'ES' }
client.address("Blasco Ibañez, Valencia", components)
```

  Available components to be used can be found here:
  https://developers.google.com/maps/documentation/geocoding/#ComponentFiltering

### Reverse geocoding (by latitude and longitude)

```ruby
Geogle::Geocoder.new.latlng(39.5073225, -0.2914778)
```

### Using a business account

```ruby
client = Geogle::Geocoder.new({ client_id: "gme-client-id", crypto_key: "crypto-key" })
client.latlng(39.5073225, -0.2914778)
```

  The signature required to do the request will be included in the URL.

### Directions

Still in development!

## Search using address names for origin and destination

```ruby
client = Geogle::Directions.new
client.routes("Berlin", "Munich", { region: "de" })
```

## Search using geo-locations for origin and destination

```ruby
client = Geogle::Directions.new
client.routes("39.4699889,-0.3759178", "40.4167158,-3.7037799")
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
