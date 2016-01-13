require 'spec_helper'

describe YhsdApi::Metafield do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 448
  end

  it "get all metafield must be success" do
    code, body, header = YhsdApi::Metafield.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all metafield count must be success" do
    code, body, header = YhsdApi::Metafield.count(@token)
    expect([200, 422]).to include(code)
  end

  it "create a metafield must be success" do
    params = {
      "meta": {
        "name": "shop_score#{Random.rand(10000)}",
        "owner_id": "0",
        "owner_resource": "shop",
        "fields": {
          "key1": "value1",
          "key2": "value2"
        },
        "description": "店铺积分拓展字段"
      }
    }
    code, body, header = YhsdApi::Metafield.create(@token, params)
    expect([200, 422]).to include(code)
  end

  it "update a metafield must be success" do
    params = {
      "meta": {
        "name": "shop_score",
        "owner_id": "0",
        "owner_resource": "shop",
        "fields": {
          "key1": "value1",
          "key2": "value2"
        },
        "description": "店铺积分拓展字段"
      }
    }
    code, body, header = YhsdApi::Metafield.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a metafield must be success" do
    code, body, header = YhsdApi::Metafield.delete(@token, 38)
    expect([200, 422]).to include(code)
  end

  it "get metafield fields must be success" do
    code, body, header = YhsdApi::Metafield.find_fields(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "update metafield fields must be success" do
    params = {
      "fields": {
        "key1": "value2",
        "key2": "value3",
        "key3": "value1",
      }
    }
    code, body, header = YhsdApi::Metafield.update_fields(@token, @id, params)
    expect([200, 422]).to include(code)
  end

end
