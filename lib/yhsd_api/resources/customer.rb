module YhsdApi

  class Customer < YhsdApi::Base

    def self.all(token, params = nil)
      path = "customers#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token)
      path = "customers/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, id, params = nil)
      path = "customers/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, params)
      path = "customers"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, id, params)
      path = "customers/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, id)
      path = "customers/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end