require 'spec_helper'

describe YhsdApi::Metafield do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @id = 48
  end

  it "get all metafield must be success" do
    code, body, header = YhsdApi::Metafield.all(@token)
    expect(code).to eq(200)
  end

  it "get all metafield count must be success" do
    code, body, header = YhsdApi::Metafield.count(@token)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

  it "delete a metafield must be success" do
    code, body, header = YhsdApi::Metafield.delete(@token, 38)
    expect(code).to eq(422)
  end

  it "get metafield fields must be success" do
    code, body, header = YhsdApi::Metafield.find_fields(@token, @id)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

end
