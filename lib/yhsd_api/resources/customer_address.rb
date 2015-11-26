module YhsdApi

  class CustomerAddress < YhsdApi::Base

    def self.all(token, customer_id, params = nil)
      path = "customers/#{customer_id}/addresses#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, customer_id)
      path = "customers/#{customer_id}/addresses/count"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, customer_id, id, params = nil)
      path = "customers/#{customer_id}/addresses/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, customer_id, params)
      path = "customers/#{customer_id}/addresses"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, customer_id, id, params)
      path = "customers/#{customer_id}/addresses/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, customer_id, id)
      path = "customers/#{customer_id}/addresses/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end