# frozen_string_literal: true

require_relative "vendo_api_sdk_task/version"
require_relative "vendo_lib/rest_lib"

module VendoApiSdkTask

  ENDPOINTS = 
  {
    "authentication": "/spree_oauth/token",
    "cart": "/storefront/cart"
  }

  BASE_URL = "https://demo.getvendo.com/api/v2"

  HEADER = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  }

  # authentication
  def self.authenticate(user_name="", password="")
    rest_lib = Restlib.new(header: set_header, body: {}, url: form_url("authentication"))
    response = rest_lib.post
  end

  # create new cart
  def self.create_new_cart
    rest_lib = Restlib.new(header: set_headers, body: {}, url: form_url("cart"))
    response = rest_lib.post
  end

  # fetch a cart
  def self.fetch_cart
    @api = Restlib.new()
  end

  # adding item to cart
  def self.add_to_cart(product_ids = [])
    @api = Restlib.new()
  end

  # chaging quantity
  def self.change_product_quantity(product_id, product_quantity)
    @api = Restlib.new()
  end
  # removing item
  def self.remove_item(product_id)
    @api = Restlib.new()
  end
  # applying coupon code
  def self.discount_coupon(coupon_code = "")
    @api = Restlib.new()
  end

  def self.set_headers
    {
        'Accept' => HEADER["Accept".to_sym],
        'Content-Type' => HEADER["Content-Type".to_sym]
    }
  end

  def self.form_url(request_type)
    "#{BASE_URL}#{ENDPOINTS[request_type.to_sym]}"
  end
end
