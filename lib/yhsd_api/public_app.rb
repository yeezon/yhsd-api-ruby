module YhsdApi

  class PublicApp

    class << self

      ###
      #生成友好速搭安装回调地址方法
      ###
      def authorize_url(redirect_uri, shop_key, state = '')
        raise MissingAppKey if YhsdApi.configuration.app_key.to_s.empty?
        raise MissingScope if YhsdApi.configuration.scope.to_s.empty?

        params = "?response_type=code"
        params +="&client_id=#{YhsdApi.configuration.app_key}"
        params +="&shop_key=#{shop_key}"
        params +="&scope=#{YhsdApi.configuration.scope}"
        params +="&redirect_uri=#{redirect_uri}"
        params +="&state=#{state}" unless state.to_s.empty?

        URI.join(YhsdApi.configuration.auth_url, params).to_s
      end

      ###
      #通过友好速搭分发的code获取店铺访问token方法
      ###
      def generate_token(redirect_uri, code)
        raise MissingAppKey if YhsdApi.configuration.app_key.to_s.empty?

        req_body = {
          "grant_type" => 'authorization_code',
          "code" => code,
          "client_id" => YhsdApi.configuration.app_key,
          "redirect_uri" => redirect_uri
        }

        opts = {
          :headers =>{
            :content_type => "application/x-www-form-urlencoded"
          }
        }
        
        code, body, header = HTTP::post(YhsdApi.configuration.token_url, req_body, opts)
        if code == 200
          Oj.load(body)["token"]
        else
          raise Exception.new(body)
        end

      end

      def get(token, url)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::get(url, opts)
      end

      def delete(token, url)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::delete(url, opts)
      end

      def post(token, url, req_body)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token,
          :content_type => :json,
          :accept => :json
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::post(url, req_body.to_json, opts)
      end

      def put(token, url, req_body)
        validate_token(token)
        
        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token,
          :content_type => :json,
          :accept => :json
        }}

        if url && !url.start_with?('http://') && !url.start_with?('https://')
          url = URI.join(YhsdApi.configuration.api_url, YhsdApi.configuration.api_version, url)
        end

        YhsdApi::HTTP::put(url, req_body.to_json, opts)
      end

      def validate_token token
        raise MissingToken if token.to_s.empty?
      end

      def verify_hmac(params)
        YhsdApi::Helper::hmac_verify(YhsdApi.configuration.app_secret, params)
      end

    end

  end

end