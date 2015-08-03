require 'spec_helper'

describe YhsdApp::PrivateApp do

  before(:each) do
    YhsdApp.configure do |config|
      config.app_key = 'a3769cf4b554454f9f099ea8c2f682b5'
      config.app_secret = '64e1faedf62a41e89b6f7d0c73bd0812'
      config.token_url = 'http://apps.localtest.com/oauth2/token/'
      config.api_url = 'http://api.public.com/v1/'
    end
  end

  it "token is nil should raises error" do
    path = "products"
    expect {code, body, header = YhsdApp::PrivateApp.get(YhsdApp.configuration.api_url + path)}.to raise_error(YhsdApp::MissingToken)
  end

  it "url is null should raises error" do
    YhsdApp::PrivateApp.generate_token
    expect {code, body, header = YhsdApp::PrivateApp.get(nil)}.to raise_error(YhsdApp::MissingURI)
  end

  it "private app generate_token" do
    token = YhsdApp::PrivateApp.generate_token
  end

  it "private app get" do
    YhsdApp::PrivateApp.generate_token
    path = "redirects"
    code, body, header = YhsdApp::PrivateApp.get(YhsdApp.configuration.api_url + path)
    expect(code).to eq(200)
  end

  it "private app post" do
    YhsdApp::PrivateApp.generate_token
    path = "redirects"
    params = {
        "redirect": {
          "path": "/123",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApp::PrivateApp.post(YhsdApp.configuration.api_url + path, params)
    expect([200, 422]).to include(code)
  end

  it "private app put" do
    YhsdApp::PrivateApp.generate_token
    path = "redirects/23"
    params = {
        "redirect": {
          "path": "/66",
          "target": "/blogs"
        }
    }
    code, body, header = YhsdApp::PrivateApp.put(YhsdApp.configuration.api_url + path, params)
    expect([200, 422]).to include(code)
  end

  it "private app delete" do
    YhsdApp::PrivateApp.generate_token
    path = "redirects/23"
    code, body, header = YhsdApp::PrivateApp.delete(YhsdApp.configuration.api_url + path)
    expect([200, 422]).to include(code)
  end

end