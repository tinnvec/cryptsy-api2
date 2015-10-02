module Cryptsy
  module API2
    class Currencies
      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      def list
        Request.send("currencies")
      end

      def info(currency_id)
        Request.send("currencies/#{currency_id}")
      end

      def marketlist(currency_id)
        Request.send("currencies/#{currency_id}/markets")
      end

      # Need extra special access for these, think about testing later?
      #
      # def status(currency_id)
      #   Request.send("currencies/#{currency_id}/status", {}, @public_key, @private_key)
      # end
    end
  end
end
