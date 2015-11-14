require 'spec_helper'

describe YhsdApi::Asset do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @theme_id = 12763
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
    expect(code).to eq(200)
  end

  it "delete theme asset file must be success" do
    params = {
      "asset[key]": "templates/teewar.html"
    }
    code, body, header = YhsdApi::Asset.delete(@token, @theme_id, params)
    expect(code).to eq(422)
  end

end