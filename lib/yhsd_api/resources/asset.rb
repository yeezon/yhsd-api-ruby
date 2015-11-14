module YhsdApi

  class Asset < YhsdApi::Base

    def self.all(token, theme_id, params = nil)
      path = "themes/#{theme_id}/assets#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, theme_id, params = nil)
      path = "themes/#{theme_id}/assets#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, theme_id, params = {})
      path = "themes/#{theme_id}/assets"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, theme_id, params)
      path = "themes/#{theme_id}/assets"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, theme_id, params = nil)
      path = "themes/#{theme_id}/assets#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end