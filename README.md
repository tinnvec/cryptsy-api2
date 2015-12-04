Cryptsy API v2
==============
[![Code Climate](https://codeclimate.com/github/tinnvec/cryptsy-api2/badges/gpa.svg)](https://codeclimate.com/github/tinnvec/cryptsy-api2)
[![Test Coverage](https://codeclimate.com/github/tinnvec/cryptsy-api2/badges/coverage.svg)](https://codeclimate.com/github/tinnvec/cryptsy-api2/coverage)
[![Build Status](https://travis-ci.org/tinnvec/cryptsy-api2.svg)](https://travis-ci.org/tinnvec/cryptsy-api2)  

A Ruby wraper for Cryptsy API v2

Installation
------------
Add this line to your `Gemfile`
```ruby
gem 'cryptsy-api2'
```

Then run bundler
```bash
$ bundle install
```

Usage
-----
```ruby
require 'cryptsy/api2'
api = Cryptsy::API2::Client.new(public_key, private_key)
```

Examples
--------
```ruby
api.markets.info 'ltc_btc'

{
  "id" => "3",
  "label" => "LTC/BTC",
  "coin_currency_id" => "2",
  "market_currency_id" => "3",
  "maintenance_mode" => "0",
  "verifiedonly" => false,
  "24hr" => {
    "volume" => 23284.88931944,
    "volume_btc" => 376.20375262,
    "price_high" => 0.017,
    "price_low" => 0.01549999
  },
  "last_trade" => {
    "price" => 0.01602871,
    "date" => "2015-07-25 13:00:24",
    "timestamp" => 1437843624
  }
}
```

Support
--------
Like my code? Want to support my coffee habit? http://tinnvec.com/support
