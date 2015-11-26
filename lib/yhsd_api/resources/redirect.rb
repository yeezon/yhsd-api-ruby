module YhsdApi

  class Redirect < YhsdApi::Base

    def self.all(token, params = nil)
      path = "redirects#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token)
      path = "redirects/count"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, id, params = nil)
      path = "redirects/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, params)
      path = "redirects"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, id, params)
      path = "redirects/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, id)
      path = "redirects/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end