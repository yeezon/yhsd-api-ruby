module YhsdApi

  class ScriptTag < YhsdApi::Base

    def self.all(token, params = nil)
      path = "script_tags#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token)
      path = "script_tags/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, id, params = nil)
      path = "script_tags/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.create(token, params)
      path = "script_tags"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::post(uri, params.to_json, build_header(token))
    end

    def self.update(token, id, params)
      path = "script_tags/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::put(uri, params.to_json, build_header(token))
    end

    def self.delete(token, id)
      path = "script_tags/#{id}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::delete(uri, build_header(token))
    end

  end

end