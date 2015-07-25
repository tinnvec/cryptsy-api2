require 'minitest/autorun'
require 'cryptsy/api2'

ENV['CODECLIMATE_REPO_TOKEN'] = '6923f8340c8b1bc2fed3707c98224bd79c3e9836e082e27f4dd2aea5873b3182'
require_relative 'test_helper'

class TestAPI2 < Minitest::Test

   def setup
     @api = Cryptsy::API2::Client.new
   end

   def test_markets_list_not_nil
     assert @api.markets.list != nil
   end
 end
