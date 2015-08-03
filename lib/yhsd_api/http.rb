require 'rest-client'

module YhsdApi

  class HTTP

    class << self

      def get(url, opts = {})
        validate_url(url)

        req_headers = {}

        if opts[:headers].is_a?(Hash)
          req_headers.merge!(opts[:headers])
        end

        begin
          response = RestClient.get(url.to_s, req_headers)
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
          response = RestClient.post(url.to_s, req_body, req_headers)
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
          response = RestClient.put(url.to_s, req_body, req_headers)
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
          response = RestClient.delete(url.to_s, req_headers)
          return response.code.to_i, response.body, response.raw_headers
        rescue Exception => e
          return e.http_code.to_i, e.response, {}
        end

      end

      def validate_url(url)
        raise MissingURI if url.to_s.empty?
      end

    end

  end

end