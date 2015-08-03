module YhsdApp

  class PublicApp

    class << self

      def verify_hmac(params = {})
        raise MissingAppSecret if YhsdApp.configuration.app_secret.to_s.empty?

        hmac = params[:hmac].to_s
        return false if hmac.empty?
        p = params.delete_if{|key, value| key == "hmac"}
        str = p.keys.sort.map do |k|
          "#{k.to_s}=#{params[k].to_s}"
        end.join('&')
        digest = OpenSSL::Digest.new('sha256')
        hmac == OpenSSL::HMAC.hexdigest(digest, YhsdApp.configuration.app_secret, str)

      end

      def authorize_url(redirect_uri, shop_key, state = '')
        raise MissingAppKey if YhsdApp.configuration.app_key.to_s.empty?
        raise MissingScope if YhsdApp.configuration.scope.to_s.empty?

        params = "?response_type=code"
        params +="&client_id=#{YhsdApp.configuration.app_key}"
        params +="&shop_key=#{shop_key}"
        params +="&scope=#{YhsdApp.configuration.scope}"
        params +="&redirect_uri=#{redirect_uri}"
        params +="&state=#{state}" unless state.to_s.empty?

        URI.join(YhsdApp.configuration.auth_url, params).to_s
      end

      def generate_token(redirect_uri, code)
        raise MissingAppKey if YhsdApp.configuration.app_key.to_s.empty?

        req_body = {
          "grant_type" => 'authorization_code',
          "code" => code,
          "client_id" => YhsdApp.configuration.app_key,
          "redirect_uri" => redirect_uri
        }

        opts = {
          :headers =>{
            :content_type => "application/x-www-form-urlencoded"
          }
        }
        
        code, body, header = HTTP::post(YhsdApp.configuration.token_url, req_body, opts)
        if code == 200
          JSON.parse(body)["token"]
        else
          raise Exception.new(body)
        end

      end

      def get(token, url)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token
        }}

        YhsdApp::HTTP::get(url, opts)
      end

      def delete(token, url)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token
        }}

        YhsdApp::HTTP::delete(url, opts)
      end

      def post(token, url, req_body)
        validate_token(token)

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token,
          :content_type => :json,
          :accept => :json
        }}

        YhsdApp::HTTP::post(url, req_body.to_json, opts)
      end

      def put(token, url, req_body)
        validate_token(token)
        
        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => token,
          :content_type => :json,
          :accept => :json
        }}

        YhsdApp::HTTP::put(url, req_body.to_json, opts)
      end

      def validate_token token
        raise MissingToken if token.to_s.empty?
      end
    end

  end

end