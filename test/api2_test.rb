require 'minitest/autorun'
require 'cryptsy/api2'

class TestAPI2 < Minitest::Test

   def setup
     @api = Cryptsy::API2::Client.new
   end

   def test_markets_list_not_nil
     assert @api.markets.list != nil
   end
 end
