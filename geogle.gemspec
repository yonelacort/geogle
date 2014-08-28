# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geogle/version'

Gem::Specification.new do |spec|
  spec.name          = "geogle"
  spec.version       = Geogle::VERSION
  spec.authors       = ["yone_lc"]
  spec.email         = ["yonelacort@gmail.com"]
  spec.description   = %q{Ruby wrapper for Google MAPS API V3 geocode interface}
  spec.summary       = %q{Provides a Ruby interface to geocode requests to Google Maps API V3 and parse the response}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'virtus'
  spec.add_dependency 'ruby-hmac'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "guard-rspec"
end
