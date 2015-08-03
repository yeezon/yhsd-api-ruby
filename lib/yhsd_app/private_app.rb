module YhsdApp

  class PrivateApp

    class << self

      attr_accessor :token

      def generate_token
      
        req_body = {
          "grant_type" => 'client_credentials'
        }

        opts = {
          :headers =>{
            :Authorization => generate_authorization,
            :content_type => "application/x-www-form-urlencoded"
          }
        }
        
        code, body, header = HTTP::post(YhsdApp.configuration.token_url, req_body, opts)
        if code == 200
          @token = JSON.parse(body)["token"]
          @token
        else
          raise Exception.new(body)
        end

      end

      def generate_authorization
        content = "#{YhsdApp.configuration.app_key}:#{YhsdApp.configuration.app_secret}"
        encode = Base64.encode64(content).delete("\n\r")
        "Basic #{encode}"
      end
        
      def get(url)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token
        }}

        YhsdApp::HTTP::get(url, opts)
      end

      def delete(url)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token
        }}

        YhsdApp::HTTP::delete(url, opts)
      end

      def post(url, req_body)

        validate_token

        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token,
          :content_type => :json,
          :accept => :json
        }}

        YhsdApp::HTTP::post(url, req_body.to_json, opts)
      end

      def put(url, req_body)

        validate_token
        
        opts = {:headers => {
          "X-API-ACCESS-TOKEN" => @token,
          :content_type => :json,
          :accept => :json
        }}

        YhsdApp::HTTP::put(url, req_body.to_json, opts)
      end

      def validate_token
        raise MissingToken if @token.to_s.empty?
      end
    end

  end

end