module YhsdApi

  class City < YhsdApi::Base

    def self.all(token, country_id, province_id, params = nil)
      path = "countries/#{country_id}/provinces/#{province_id}/cities#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, country_id, province_id)
      path = "countries/#{country_id}/provinces/#{province_id}/cities/count"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, country_id, province_id, id, params = nil)
      path = "countries/#{country_id}/provinces/#{province_id}/cities/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

  end

end