require 'spec_helper'

describe YhsdApi::Asset do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @theme_id = 14130
  end

  it "get all assets info will success" do
    code, body, header = YhsdApi::Asset.all(@token, @theme_id)
    expect(code).to eq(200)
  end

  it "get single theme info will success" do
    params = {
      "asset[key]": "templates/account/change_password.html"
    }
    code, body, header = YhsdApi::Asset.find(@token, @theme_id, params)
    expect(code).to eq(200)
  end

  it "create theme asset file must be success" do
    params = {
      "asset": {
        "key": "templates/test#{Random.rand(200)}.html",
        "value": "#{Random.rand(200)}"
      }
    }
    code, body, header = YhsdApi::Asset.create(@token, @theme_id, params)
    expect(code).to eq(200)
  end

  it "update theme asset file must be success" do
    params = {
      "asset": {
        "key": "templates/test139.html",
        "value": "#{Random.rand(200)}"
      }
    }
    code, body, header = YhsdApi::Asset.update(@token, @theme_id, params)
    expect([200, 422]).to include(code)
  end

  it "delete theme asset file must be success" do
    params = {
      "asset[key]": "templates/teewar.html"
    }
    code, body, header = YhsdApi::Asset.delete(@token, @theme_id, params)
    expect([200, 422]).to include(code)
  end

end