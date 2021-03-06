module Cryptsy
  module API2
    class Order
      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      # Required Options:
      # { marketid: 0, ordertype: 'buy|sell', quantity: 0.00, price: 0.00 }
      def create(options)
        Request.send("order", options, @public_key, @private_key, "POST")
      end

      def info(order_id)
        Request.send("order/#{order_id}", {}, @public_key, @private_key)
      end

      def delete(order_id)
        Request.send("order/#{order_id}", {}, @public_key, @private_key, "DELETE")
      end
    end
  end
end
