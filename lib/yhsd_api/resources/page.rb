module YhsdApi

  class Page < YhsdApi::Base

    def self.all(token, params = nil)
      path = "pages#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token)
      path = "pages/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, id, params = nil)
      path = "pages/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, params)
      path = "pages"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, id, params)
      path = "pages/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, id)
      path = "pages/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end