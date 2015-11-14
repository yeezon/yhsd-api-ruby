module YhsdApi

  class ProductVariant < YhsdApi::Base

    def self.all(token, product_id, params = nil)
      path = "products/#{product_id}/variants#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, product_id)
      path = "products/#{product_id}/variants/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, product_id, id, params = nil)
      path = "products/#{product_id}/variants/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, product_id, params)
      path = "products/#{product_id}/variants"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, product_id, id, params)
      path = "products/#{product_id}/variants/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, product_id, id)
      path = "products/#{product_id}/variants/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end