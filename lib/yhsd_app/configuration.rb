module YhsdApp

  class Configuration

    attr_accessor :app_key
    attr_accessor :app_secret
    attr_accessor :scope
    attr_accessor :auth_url
    attr_accessor :token_url
    attr_accessor :api_url

    def initialize
      @auth_url = "https://apps.youhaosuda.com/oauth2/authorize/"
      @token_url = 'https://apps.youhaosuda.com/oauth2/token/'
      @api_url = 'https://api.youhaosuda.com/v1/'
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