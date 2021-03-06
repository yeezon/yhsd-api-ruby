module YhsdApi

  class PrivateApp

    class << self

      attr_accessor :token

      ###
      #友好速搭私有App 获取API调用token 方法
      ###
      def generate_token
      
        req_body = {
          "grant_type" => 'client_credentials'
        }

        opts = {
          :headers =>{
            :Authorization => YhsdApi::Helper::authorization(YhsdApi.configuration.app_key,YhsdApi.configuration.app_secret),
            :content_type => "application/x-www-form-urlencoded"
          }
        }
        
        code, body, header = HTTP::post(YhsdApi.configuration.token_url, req_body, opts)
        if code == 200
          @token = Oj.load(body)["token"]
          @token
        else
          raise Exception.new(body)
        end

      end

      def get(url)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::get(url, opts)
      end

      def delete(url)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::delete(url, opts)
      end

      def post(url, req_body)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token,
          :content_type => :json,
          :accept => :json
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::post(url, req_body.to_json, opts)
      end

      def put(url, req_body)

        validate_token
        
        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token,
          :content_type => :json,
          :accept => :json
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::put(url, req_body.to_json, opts)
      end

      def validate_token
        raise MissingToken if @token.to_s.empty?
      end

      def handle_query_string(params)
        return '' unless params === Hash
        params.keys.map do |k|
          "#{CGI.escape(k.to_s)}=#{CGI.escape(params[k].to_s)}"
        end.join('&')
      end

    end

  end

end