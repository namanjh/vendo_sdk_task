# frozen_string_literal: true

require_relative "vendo_api_sdk_task/version"
require_relative "vendo_lib/rest_lib"
require 'byebug'

module VendoApiSdkTask
  class VendoApi
    ENDPOINTS = 
    {
      "authentication": "/spree_oauth/token",
      "cart": "/storefront/cart"
    }

    BASE_URL = 
    {
      "others": "https://demo.getvendo.com/api/v2",
      "authentication": "https://demo.getvendo.com/spree_oauth/token"
    }

    HEADER = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    }

    SUCCESS_CODES = [200, 201]

    # authentication
    def authenticate(user_name="", password="")
      rest_lib = Restlib.new(header: set_header, body: {}, url: form_url("authentication", "authentication"))
      response = rest_lib.post
    end

    # create new cart
    def create_new_cart
      rest_lib = Restlib.new(header: set_headers, body: {}, url: form_url("cart"))
      response = rest_lib.post
      return if response.body.nil?

      return unless SUCCESS_CODES.include? response.code

      response.parsed_response["data"]["attributes"]["token"]
    end

    # fetch a cart
    def fetch_cart(vendo_cart_token)
      return if vendo_cart_token.nil?

      header = set_headers.merge!({ "X-Vendo-Order-Token": vendo_cart_token })
      rest_lib = Restlib.new(header: set_headers, body: {}, url: form_url("cart"))
      response = rest_lib.get
      return if response.body.nil?

      return unless SUCCESS_CODES.include? response.code

      @order_cart = response.parsed_response["data"]
    end

    # adding item to cart
    def add_to_cart(product_ids = [])
    end

    # chaging quantity
    def change_product_quantity(product_id, product_quantity)
    end
    
    # removing item
    def remove_item(product_id)
    end

    # applying coupon code
    def discount_coupon(coupon_code = "")
    end

    def set_headers
      {
          'Accept' => HEADER["Accept".to_sym],
          'Content-Type' => HEADER["Content-Type".to_sym]
      }
    end

    # set_order_token_header
    def set_order_token_header
      {
        "X-Vendo-Order-Token": @vendo_order_token
      }
    end

    # form url from base url and endpoint
    def form_url(request_type, base_url = "others")
      "#{BASE_URL[base_url.to_sym]}#{ENDPOINTS[request_type.to_sym]}"
    end
  end
end
