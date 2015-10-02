module Cryptsy
  module API2
    class Converter
      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      def create(options)
        Request.send("converter", options, @public_key, @private_key, "POST")
      end

      def info(quote_id)
        Request.send("converter/#{quote_id}", {}, @public_key, @private_key)
      end

      def depositaddress(quote_id)
        Request.send("converter/#{quote_id}/depositaddress", {}, @public_key, @private_key)
      end
    end
  end
end
