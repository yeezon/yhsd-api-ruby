require 'spec_helper'

describe YhsdApi::PublicApp do

  before(:each) do
    YhsdApi.configure do |config|
      config.app_key = '57a7a5aeeb6b4db78f776e3add846e67'
      config.app_secret = 'ca5c91b5ea1f48b78e8bf88ce8d8a6b2'
      config.scope = 'read_basic,
      write_basic        '
    end
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    @shop_key = '1bf2910a4df7ec3c211a9f39881716f8'
    @redirect_url = 'https://youhaosuda.com'
    @code = 'cb9b25dff47f40bc95e5244023ef05f9'
  end

  it "public app get authorize_url" do
    uri = YhsdApi::PublicApp.authorize_url(@redirect_url, @shop_key)
    expect(uri).to be_kind_of(String)
  end

  it "public app generate token " do
    token = YhsdApi::PublicApp.generate_token(@redirect_url, @code)
    expect(token).to be_kind_of(String)
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
  

  it "symbol verify_hmac must be success" do
    YhsdApi.configure do |config|
      config.app_secret = 'hush'
    end
    params = {  
      "shop_key": "a94a110d86d2452eb3e2af4cfb8a3828",  
      "code": "a84a110d86d2452eb3e2af4cfb8a3828",  
      "account_id": "1",
      "time_stamp": "2013-08-27T13:58:35Z",    
      "hmac": "a2a3e2dcd8a82fd9070707d4d921ac4cdc842935bf57bc38c488300ef3960726"
    }
    expect(YhsdApi::PublicApp::verify_hmac(params)).to eq(true)
  end

  it "string verify_hmac must be success" do
    YhsdApi.configure do |config|
      config.app_secret = 'hush'
    end
    params = {  
      "shop_key" => "a94a110d86d2452eb3e2af4cfb8a3828",  
      "code" => "a84a110d86d2452eb3e2af4cfb8a3828",  
      "account_id" => "1",
      "time_stamp" => "2013-08-27T13:58:35Z",    
      "hmac" => "a2a3e2dcd8a82fd9070707d4d921ac4cdc842935bf57bc38c488300ef3960726"
    }
    expect(YhsdApi::PublicApp::verify_hmac(params)).to eq(true)
  end
  
end