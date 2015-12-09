module YhsdApi

  class Configuration

    attr_accessor :app_key
    attr_accessor :app_secret
    attr_accessor :scope
    attr_accessor :auth_url
    attr_accessor :token_url
    attr_accessor :api_url
    attr_accessor :api_version
    attr_accessor :call_limit_protect

    def initialize
      @auth_url = "https://apps.youhaosuda.com/oauth2/authorize/"
      @token_url = 'https://apps.youhaosuda.com/oauth2/token/'
      @api_url = 'https://api.youhaosuda.com/'
      @api_version = 'v1/'
      @call_limit_protect = false
    end

    def scope
      @scope.to_s.gsub(/\s+/, "")
    end

    def api_version
      unless @api_version.end_with?("/")
        @api_version.to_s + "/"
      else
        @api_version
      end
    end
    
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end

end
