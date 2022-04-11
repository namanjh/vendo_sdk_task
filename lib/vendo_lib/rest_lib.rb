# frozen_string_literal: true

require "httparty"

class Restlib

    def initialize(params = {})
        @header = params[:headers]
        @body = params[:body]
        @url = params[:url]
    end

    def post
        HTTParty.post(@url.to_str, body: @body, headers: @header, verify: false)
    rescue StandardError => e
        Rails.logger.error(e)
        nil
    end

    def get
        HTTParty.get(@url.to_str, headers: @header, verify: false)
    rescue StandardError => e
        Rails.logger.error(e)
        nil
    end

    def delete
        HTTParty.delete(@url.to_str, headers: @header, verify: false)
    rescue StandardError => e
        Rails.logger.error(e)
        nil
    end

    def patch
        HTTParty.patch(@url.to_str, body: @body, headers: @header, verify: false)
    rescue StandardError => e
        Rails.logger.error(e)
        nil
    end

    def put
        HTTParty.put(@url.to_str, body: @body, headers: @header, verify: false)
    rescue StandardError => e
        Rails.logger.error(e)
        nil
    end
end
