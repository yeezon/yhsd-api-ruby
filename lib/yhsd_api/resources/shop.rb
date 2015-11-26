module YhsdApi

  class Shop < YhsdApi::Base

    def self.info(token, params = {})
      path = "shop#{handle_query_string(params)}"
      uri = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, path)
      YhsdApi::HTTP::get(uri, build_header(token))
    end

  end

end