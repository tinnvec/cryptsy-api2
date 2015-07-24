module Cryptsy
  module API2
    class Trigger

      def initialize(public_key=nil, private_key=nil)
        @public_key = public_key
        @private_key = private_key
      end

      def create(options)
        Request.send("trigger", options, @public_key, @private_key, "POST")
      end

      def info(trigger_id)
        Request.send("trigger/#{trigger_id}", {}, @public_key, @private_key)
      end

      def delete(trigger_id)
        Request.send("trigger/#{trigger_id}", {}, @public_key, @private_key, "DELETE")
      end
    end
  end
end
