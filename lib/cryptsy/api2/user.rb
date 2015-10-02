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
        make_user_request("balances", currency_id, options)
      end

      def deposits(currency_id=nil, options={})
        make_user_request("deposits", currency_id, options)
      end

      def addresses(currency_id=nil, options={})
        make_user_request("addresses", currency_id, options)
      end

      def orders(currency_id=nil, options={})
        make_user_request("orders", currency_id, options)
      end

      def triggers(currency_id=nil, options={})
        make_user_request("triggers", currency_id, options)
      end

      def tradehistory(options={})
        Request.send("tradehistory", options, @public_key, @private_key)
      end

      def validatetradekey(tradekey)
        Request.send("validatetradekey", { tradekey: tradekey }, @public_key, @private_key)
      end

      def transfers(currency_id=nil, options={})
        make_user_request("transfers", currency_id, options)
      end

      def withdrawals(currency_id=nil, options={})
        make_user_request("withdrawals", currency_id, options)
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

      private

        def make_user_request(path, currency_id=nil, options={})
          path += "/#{currency_id}" unless currency_id.nil?
          Request.send(path, options, @public_key, @private_key)
        end
    end
  end
end
