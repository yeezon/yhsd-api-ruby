require 'rest-client'

module YhsdApi

  class HTTP

    class << self

      @@last_at = nil
      @@limit = 0
      @@total = 0

      def get(url, opts = {})
        validate_url(url)

        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end

        begin
          begin_request if YhsdApi.configuration.call_limit_protect
          response = RestClient.get(url.to_s, req_headers)
          after_request(response.raw_headers) if YhsdApi.configuration.call_limit_protect
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end

      end

      def post(url, req_body = nil, opts = {})
        validate_url(url)

        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end
        
        begin
          begin_request if YhsdApi.configuration.call_limit_protect
          response = RestClient.post(url.to_s, req_body, req_headers)
          after_request(response.raw_headers) if YhsdApi.configuration.call_limit_protect
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end

      end

      def put(url, req_body = nil, opts = {})
        validate_url(url)

        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end

        begin
          begin_request if YhsdApi.configuration.call_limit_protect
          response = RestClient.put(url.to_s, req_body, req_headers)
          after_request(response.raw_headers) if YhsdApi.configuration.call_limit_protect
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end

      end

      def delete(url, opts = {})
        validate_url(url)

        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end

        begin
          begin_request if YhsdApi.configuration.call_limit_protect
          response = RestClient.delete(url.to_s, req_headers)
          after_request(response.raw_headers) if YhsdApi.configuration.call_limit_protect
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end

      end

      def validate_url(url)
        raise MissingURI if url.to_s.empty?
      end

      def after_request(header)
        begin
          if header && header.is_a?(Hash) && header.keys.include?("x-yhsd-shop-api-call-limit")
            call_limit =  header["x-yhsd-shop-api-call-limit"].first.split("/")
            @@limit, @@total = call_limit[0].to_i, call_limit[1].to_i
            @@last_at = Time.now.to_i
          end
        end
      end

      def begin_request
        if @@last_at
          if Time.now.to_i - @@last_at <= 1000 && @@total - @@limit <= 2
            sleep(1)
          end
        end
      end

    end

  end

end