Gem::Specification.new do |spec|
  spec.name        = 'cryptsy-api2'
  spec.version     = '0.9.5'
  spec.date        = '2015-07-24'
  spec.summary     = "Cryptsy API v2"
  spec.description = "Ruby library for Cryptsy API v2"
  spec.author      = "Alex Hanna"
  spec.email       = 'tinnvec@gmail.com'
  spec.files       = ["lib/cryptsy/api2.rb",
                      "lib/cryptsy/api2/converter.rb",
                      "lib/cryptsy/api2/currencies.rb",
                      "lib/cryptsy/api2/markets.rb",
                      "lib/cryptsy/api2/order.rb",
                      "lib/cryptsy/api2/trigger.rb",
                      "lib/cryptsy/api2/user.rb"]
  spec.homepage    = 'https://github.com/tinnvec/cryptsy-api2'
  spec.license     = 'ISC'

  spec.add_runtime_dependency 'httparty', '~> 0.13.5'
end
