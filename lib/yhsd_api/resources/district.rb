module YhsdApi

  class District < YhsdApi::Base

    def self.all(token, country_id, province_id, city_id, params = nil)
      path = "countries/#{country_id}/provinces/#{province_id}/cities/#{city_id}/districts#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.count(token, country_id, province_id, city_id)
      path = "countries/#{country_id}/provinces/#{province_id}/cities/#{city_id}/districts/count"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

    def self.find(token, country_id, province_id, city_id, id, params = nil)
      path = "countries/#{country_id}/provinces/#{province_id}/cities/#{city_id}/districts/#{id}#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

  end

end