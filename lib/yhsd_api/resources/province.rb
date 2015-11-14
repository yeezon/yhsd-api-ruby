module YhsdApi

  class Province < YhsdApi::Base

    def self.all(token, country_id, params = nil)
      path = "countries/#{country_id}/provinces#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, country_id)
      path = "countries/#{country_id}/provinces/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, country_id, id, params = nil)
      path = "countries/#{country_id}/provinces/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

  end

end