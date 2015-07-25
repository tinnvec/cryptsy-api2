require 'uri'
require 'net/http'
require 'openssl'
require 'json'

require_relative 'api2/user'
require_relative 'api2/markets'
require_relative 'api2/currencies'
require_relative 'api2/order'
require_relative 'api2/converter'
require_relative 'api2/trigger'

module Cryptsy
  module API2
    class Client
      attr_accessor :user, :markets, :currencies, :order, :converter, :trigger

      def initialize(public_key=nil, private_key=nil)
        @user = User.new(public_key, private_key)
        @markets = Markets.new(public_key, private_key)
        @currencies = Currencies.new(public_key, private_key)
        @order = Order.new(public_key, private_key)
        @converter = Converter.new(public_key, private_key)
        @trigger = Trigger.new(public_key, private_key)
      end
    end

    class Request
      
      def self.send(path, query={}, public_key=nil, private_key=nil, method="GET")
        auth = !public_key.nil? && !private_key.nil?
        query[:nonce] = nonce if auth
        uri = URI("https://api.cryptsy.com/api/v2/#{path}")
        uri.query = URI.encode_www_form(query) unless query.empty?
        Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
          request = Net::HTTP::Get.new(uri)
          request = Net::HTTP::Post.new(uri) if method == "POST"
          request = Net::HTTP::Delete.new(uri) if method == "DELETE"
          request['Sign'] = sign(query, private_key) if auth
          request['Key'] = public_key if auth
          response = http.request(request)
          output = JSON.parse(response.body)
          return output['data'] if output['success']
          return output
        end
      end

      private

        def self.nonce
          (Time.now.to_f * 1000).round
        end

        def self.sign(query, private_key=nil)
          OpenSSL::HMAC.hexdigest(
            OpenSSL::Digest.new('sha512'),
            private_key.encode('utf-8'),
            URI.encode( query.map{ |k,v| "#{k}=#{v}" }.join("&") )
          )
        end
    end

  end
end
