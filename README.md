# Geogle

Ruby wrapper for the Geocoding and Directions services provided from the Google Maps API.

[![wercker status](https://app.wercker.com/status/6122e4f0966ee255949e2eb465aefd10/m "wercker status")](https://app.wercker.com/project/bykey/6122e4f0966ee255949e2eb465aefd10)
[![Gem Version](https://badge.fury.io/rb/geogle.svg)](http://badge.fury.io/rb/geogle)
[![Code Climate](https://codeclimate.com/github/yonelacort/geogle/badges/gpa.svg)](https://codeclimate.com/github/yonelacort/geogle)

## Installation

Add this line to your application's Gemfile:

    gem 'geogle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geogle

## Usage

## Geocoding
Google geocoding documentation:
https://developers.google.com/maps/documentation/geocoding/

### Setting parameters

When creating the Geogle::Geocoder these are the setting parameters:

* **sensor**:
    * **true**
    * **false** (default)
* **language**: ar, eu, bg, bn, ca, cs, da, de, el, en, en-AU, en-GB, es, eu, fa, fi, fil, fr, gl, gu, hi, hr, hu, id, it, iw, ja, kn, ko, lt, lv, ml, mr, nl, no, pl, pt, pt-BR, pt-PT, ro, ru, sk, sl, sr, sv, tl, ta, te, th, tr, uk, vi, zh-CN, zh-TW
* **raw**:
    * **true**: returns the raw json that comes in the body from the response.
    * **false** (default): returns the object created with auxiliar funtions.

* **client_id** (required for business API): ID of the client. It starts with "gme-" prefix.
* **crypto_key** (required for business API): Criptographic key.

Here's more information about Google Maps API for Business:
https://developers.google.com/maps/documentation/business/webservices

#### Data model

Both methods return an array of Geogle::Model::Place. Each place is composed by:

* **Coordinates**:
    * **lat**: Float
    * **lng**: Float

* **Area**:
    * **northeast**: Coordinates
    * **southwest**: Coordinates

* **Geometry**:
    * **location**: Coordinates
    * **location_type**: String
    * **bounds**: Area
    * **viewport**: Area
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

  The signature required to do the request will be appended in the URL.

## Directions

Google directions documentation: https://developers.google.com/maps/documentation/directions/

### Setting parameters

The same as with **Geocode**.

### Options

* **mode**: supporterd modes of transport (bicycling|walking|driving).
* **waypoints**: specifies an array of waypoints to alter a route by routing it through the specified location.
* **alternatives**: if `true` returns more than one route.
* **avoid**:
    * **tolls**: the route should avoid toll roads/bridges.
    * **highways**: the route should avoid highways,
* **units**:
    * **metric**: usage of metric system, returning distances in meters and kilometers.
    * **imperial**: usage of imperial system (British), returning distances in miles and feet.
* **region**: the code of the country to search in.

#### Data model

Return an array of Geogle::Model::Route. Each route is composed by:

* **Time**:
    * **value**: Integer
    * **text**: String
    * **time_zone**: String

* **TextValue**:
    * **value**: Integer
    * **text**: String

* **Leg**:
    * **steps**: Step
    * **distance**: TextValue
    * **duration**: TextValue
    * **arrival_time**: Time
    * **departure_time**: Time
    * **start_address**: String
    * **end_address**: String
    * **start_location**: Coordinates
    * **end_location**: Coordinates

* **Route**:
    * **summary**: String
    * **legs**: Array[Leg]
    * **waypoint_order**: Array[Integer]
    * **bounds**: Area
    * **copyrights**: String
    * **warnings**: Array[String]
    * helper methods:
      * **duration**: Total duration of all legs.
      * **distance**: Total distance of all legs.
      * **origin**: Name of starting address.
      * **destination**: Name of destination address.
      * **path**: Array of geo-location points that represents the entire path of all legs.


### Search using address names for origin and destination

```ruby
options = { region: "de", mode: "driving" }
client = Geogle::Directions.new
client.routes("Berlin", "Munich", options)
```

### Search using geo-locations for origin and destination

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
