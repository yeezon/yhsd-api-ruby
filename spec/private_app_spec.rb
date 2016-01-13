require 'spec_helper'

describe YhsdApi::PrivateApp do

  before(:each) do
    YhsdApi.configure do |config|
      config.app_key = '0249cb63872d43a28c0d9bf0ddfd6a9c'
      config.app_secret = '45ab37bed9334b86b4cb6be2b4459cdf'
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
    expect(token).to be_kind_of(String)
  end

  it "private app get" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects"
    code, body, header = YhsdApi::PrivateApp.get(path)
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
    code, body, header = YhsdApi::PrivateApp.post(path, params)
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
    code, body, header = YhsdApi::PrivateApp.put(path, params)
    expect([200, 422]).to include(code)
  end

  it "private app delete" do
    YhsdApi::PrivateApp.generate_token
    path = "redirects/23"
    code, body, header = YhsdApi::PrivateApp.delete(path)
    expect([200, 422]).to include(code)
  end

end