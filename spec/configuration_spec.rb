require 'spec_helper'

describe YhsdApi::Configuration do

  before(:each) do
    YhsdApi.configure do |config|
      config.app_key = 'd677ae82993a48fcaaf3c05ead9f46ea'
      config.app_secret = '6e6d1e96f23f49a1a59f9ce87fed1763'
      config.scope = 'read_basic,
      write_basic'
    end
  end

  it "configure app_key" do
    expect(YhsdApi.configuration.app_key).to eq('d677ae82993a48fcaaf3c05ead9f46ea')
  end

  it "configure app_secret" do
    expect(YhsdApi.configuration.app_secret).to eq('6e6d1e96f23f49a1a59f9ce87fed1763')
  end

  it "configure scope" do
    expect(YhsdApi.configuration.scope).to eq('read_basic,write_basic')
  end

  it "configure default token_url" do
    expect(YhsdApi.configuration.token_url).to eq('https://apps.youhaosuda.com/oauth2/token/')
  end

  it "configure default api_url" do
    expect(YhsdApi.configuration.api_url).to eq('https://api.youhaosuda.com/')
  end

  it "configure default auth_url" do
    expect(YhsdApi.configuration.auth_url).to eq('https://apps.youhaosuda.com/oauth2/authorize/')
  end

  it "configure default api_version" do
    expect(YhsdApi.configuration.api_version).to eq("v1/")
  end

  it "api version " do
    YhsdApi.configure do |config|
      config.api_version = "v1"
    end
    expect(YhsdApi.configuration.api_version).to eq("v1/")
  end

end