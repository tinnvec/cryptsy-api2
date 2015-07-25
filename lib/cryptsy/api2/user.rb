module Cryptsy
  module API2
    class User
      # TODO: string to id conversion for currency_id

      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      def info
        Request.send("info", {}, @public_key, @private_key)
      end

      def balances(currency_id=nil, options={})
        path = "balances"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def deposits(currency_id=nil, options={})
        path = "deposits"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def addresses(currency_id=nil, options={})
        path = "addresses"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def orders(currency_id=nil, options={})
        path = "orders"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def triggers(currency_id=nil, options={})
        path = "triggers"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def tradehistory(options={})
        Request.send("tradehistory", options, @public_key, @private_key)
      end

      def validatetradekey(tradekey)
        Request.send("validatetradekey", { tradekey: tradekey }, @public_key, @private_key)
      end

      def transfers(currency_id=nil, options={})
        path = "transfers"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      def withdrawals(currency_id=nil, options={})
        path = "withdrawals"
        path += "/#{currency_id}" unless currency_id.nil?
        Request.send(path, options, @public_key, @private_key)
      end

      # Need extra special access for these, think about testing later?
      #
      # def transfer(currency_id, options)
      #   path = "transfer"
      #   path += "/#{currency_id}" unless currency_id.nil?
      #   Request.send(path, options, @public_key, @private_key)
      # end
      #
      # def withdraw(currency_id, options)
      #   path = "withdraw"
      #   path += "/#{currency_id}" unless currency_id.nil?
      #   Request.send(path, options, @public_key, @private_key)
      # end
    end
  end
end
