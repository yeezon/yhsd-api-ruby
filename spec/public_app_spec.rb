require 'spec_helper'

describe YhsdApp::PublicApp do

  before(:each) do
    YhsdApp.configure do |config|
      config.app_key = 'd677ae82993a48fcaaf3c05ead9f46ea'
      config.app_secret = '6e6d1e96f23f49a1a59f9ce87fed1763'
      config.scope = 'read_basic,write_basic'
      config.auth_url = "https://apps.youhaosuda.com/oauth2/authorize/"
      config.token_url = 'https://apps.youhaosuda.com/oauth2/token/'
      config.api_url = 'https://api.youhaosuda.com/v1/'
    end
  end

  it "configure app_key" do
    expect(YhsdApp.configuration.app_key).to eq('d677ae82993a48fcaaf3c05ead9f46ea')
  end

  it "configure app_secret" do
    expect(YhsdApp.configuration.app_secret).to eq('6e6d1e96f23f49a1a59f9ce87fed1763')
  end

  it "configure scope" do
    expect(YhsdApp.configuration.scope).to eq('read_basic,write_basic')
  end

  it "configure auth_url" do
    expect(YhsdApp.configuration.auth_url).to eq('https://apps.youhaosuda.com/oauth2/authorize/')
  end

  it "configure token_url" do
    expect(YhsdApp.configuration.token_url).to eq('https://apps.youhaosuda.com/oauth2/token/')
  end

  it "configure api_url" do
    expect(YhsdApp.configuration.api_url).to eq('https://api.youhaosuda.com/v1/')
  end

  it "verify_hmac" do
    
  end
  

end