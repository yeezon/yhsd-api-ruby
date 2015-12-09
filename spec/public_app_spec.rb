require 'spec_helper'

describe YhsdApi::PublicApp do

  before(:each) do
    YhsdApi.configure do |config|
      config.app_key = 'd677ae82993a48fcaaf3c05ead9f46ea'
      config.app_secret = '6e6d1e96f23f49a1a59f9ce87fed1763'
      config.scope = 'read_basic,
      write_basic        '
      config.auth_url = "http://apps.localtest.com/oauth2/authorize/"
      config.token_url = 'http://apps.localtest.com/oauth2/token/'
      config.api_url = 'http://api.public.com/'
    end
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
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

  it "configure auth_url" do
    expect(YhsdApi.configuration.auth_url).to eq('http://apps.localtest.com/oauth2/authorize/')
  end

  it "configure token_url" do
    expect(YhsdApi.configuration.token_url).to eq('http://apps.localtest.com/oauth2/token/')
  end

  it "configure api_url" do
    expect(YhsdApi.configuration.api_url).to eq('http://api.public.com')
  end

  it "public app get" do
    path = "redirects"
    code, body, header = YhsdApi::PublicApp.get(@token, path)
    expect(code).to eq(200)
  end

  it "public app post" do
    path = "redirects"
    params = {
        "redirect": {
          "path": "/123",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApi::PublicApp.post(@token, path, params)
    expect([200, 422]).to include(code)
  end

  it "public app put" do
    path = "redirects/23"
    params = {
        "redirect": {
          "path": "/66",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApi::PublicApp.put(@token, path, params)
    expect([200, 422]).to include(code)
  end

  it "public app delete" do
    path = "redirects/23"
    code, body, header = YhsdApi::PublicApp.delete(@token, path)
    expect([200, 422]).to include(code)
  end
  

end