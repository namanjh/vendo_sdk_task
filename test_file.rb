require_relative 'lib/vendo_api_sdk_task'

vendo_api = VendoApiSdkTask::VendoApi.new

order_token = vendo_api.create_new_cart
cart_items = vendo_api.fetch_cart(order_token)