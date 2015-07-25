module Cryptsy
  module API2
    class Markets
      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      def list
        Request.send("markets")
      end

      def info(market_id)
        Request.send("markets/#{market_id}")
      end

      def volume(market_id=nil)
        path = "markets/volume"
        path = "markets/#{market_id}/volume" unless market_id.nil?
        Request.send(path)
      end

      def ticker(market_id=nil)
        path = "markets/ticker"
        path = "markets/#{market_id}/ticker" unless market_id.nil?
        Request.send(path)
      end

      def fees(market_id)
        Request.send("markets/#{market_id}/fees", {}, @public_key, @private_key)
      end

      def triggers(market_id)
        Request.send("markets/#{market_id}/triggers", {}, @public_key, @private_key)
      end

      def orderbook(market_id, options={})
        Request.send("markets/#{market_id}/orderbook", options)
      end

      def tradehistory(market_id, options={})
        Request.send("markets/#{market_id}/tradehistory", options)
      end

      def ohlc(market_id, options={})
        Request.send("markets/#{market_id}/ohlc", options)
      end
    end
  end
end
