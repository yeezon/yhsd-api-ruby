module YhsdApi

  class Base

    def self.handle_query_string(params = {})
      if params.is_a?(Hash) && !params.empty?
        return "?" + params.keys.map do |key|
          "#{key.to_s}=#{params[key].to_s}"
        end.join("&")
      else
        return ''
      end
    end

    def self.build_header(token)
      {:headers => {
        "X-API-ACCESS-TOKEN" => token,
        :content_type => :json,
        :accpet => :json
      }}
    end

  end

end