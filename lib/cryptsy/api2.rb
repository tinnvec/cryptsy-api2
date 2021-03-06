require 'httparty'
require 'json'
require 'openssl'
require 'uri'

require_relative 'api2/converter'
require_relative 'api2/currencies'
require_relative 'api2/markets'
require_relative 'api2/order'
require_relative 'api2/trigger'
require_relative 'api2/user'

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
        url = "https://api.cryptsy.com/api/v2/#{path}"
        query[:nonce] = nonce if auth
        options = URI.encode_www_form(query) unless query.empty?
        headers = { "Sign" => sign(query, private_key), "Key" => public_key } if auth
        params = {}
        params[:headers] = headers unless headers.nil?
        params[:query] = query unless query.empty?
        case method
        when "POST"
          params[:body] = options
          response = HTTParty.post(url, params)
        when "DELETE"
          response = HTTParty.delete(url, params)
        else
          response = HTTParty.get(url, params)
        end
        output = JSON.parse(response.body)
        return output['data'] if output['success']
        return output
      rescue JSON::ParserError => e
        return response.body
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
