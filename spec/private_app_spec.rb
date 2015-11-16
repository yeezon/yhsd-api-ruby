require 'spec_helper'

describe YhsdApi::PrivateApp do

  before(:each) do
    # YhsdApi.configure do |config|
    #   config.app_key = 'a3769cf4b554454f9f099ea8c2f682b5'
    #   config.app_secret = '64e1faedf62a41e89b6f7d0c73bd0812'
    # end
    #localtest
    YhsdApi.configure do |config|
      config.app_key = 'ab3217683c964c82a685c22d9440f240'
      config.app_secret = '13516ce822b841ce8d5b91630d97d050'
      config.token_url = 'http://apps.localtest.com/oauth2/token/'
      config.api_url = 'http://api.public.com/v1/'
      config.call_limit_protect = true
    end
  end

  it "token is nil should raises error" do
    path = "products"
    expect {code, body, header = YhsdApi::PrivateApp.get(YhsdApi.configuration.api_url + path)}.to raise_error(YhsdApi::MissingToken)
  end

  it "url is null should raises error" do
    YhsdApi::PrivateApp.generate_token
    expect {code, body, header = YhsdApi::PrivateApp.get(nil)}.to raise_error(YhsdApi::MissingURI)
  end

  it "private app generate_token" do
    token = YhsdApi::PrivateApp.generate_token
  end

  it "private app get" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects"
    code, body, header = YhsdApi::PrivateApp.get(YhsdApi.configuration.api_url + path)
    expect(code).to eq(200)
  end

  it "private app post" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects"
    params = {
        "redirect": {
          "path": "/123",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApi::PrivateApp.post(YhsdApi.configuration.api_url + path, params)
    expect([200, 422]).to include(code)
  end

  it "private app put" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects/23"
    params = {
        "redirect": {
          "path": "/66",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApi::PrivateApp.put(YhsdApi.configuration.api_url + path, params)
    expect([200, 422]).to include(code)
  end

  it "private app delete" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects/23"
    code, body, header = YhsdApi::PrivateApp.delete(YhsdApi.configuration.api_url + path)
    expect([200, 422]).to include(code)
  end

end