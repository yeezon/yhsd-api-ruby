module YhsdApi

  class Payment < YhsdApi::Base

    def self.all(token, order_id, params = nil)
      path = "orders/#{order_id}/payments#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, order_id)
      path = "orders/#{order_id}/payments/count"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, order_id, id, params = nil)
      path = "orders/#{order_id}/payments/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

  end

end