require 'spec_helper'

describe YhsdApi::ProductVariant do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @product_id = 1111
    @id = 1375
  end

  it "get all product variant must be success" do
    code, body, header = YhsdApi::ProductVariant.all(@token, @product_id)
    expect([200, 422]).to include(code)
  end

  it "get all product count must be success" do
    code, body, header = YhsdApi::ProductVariant.count(@token, @product_id)
    expect([200, 422]).to include(code)
  end

  it "get single product variant info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::ProductVariant.find(@token, @product_id, @id, params)
    expect([200, 422]).to include(code)
  end

  it "create a product variant must be success" do
    params = {
      "variant": {
        "option_1": "白#{Random.rand(200)}",
        "option_2": "萝卜",
        "option_3": "XXL",
        "price": Random.rand(200),
        "compare_price": 0,
        "stock": 9,
        "weight": 4,
        "volume": 1,
        "barcode": "",
        "image_id": nil
      }
    }
    code, body, header = YhsdApi::ProductVariant.create(@token, @product_id, params)
    expect([200, 422]).to include(code)
  end

  it "update a product variant must be success" do
    params = {
      "variant": {
        "barcode": "IPSCCC0001",
        "compare_price": Random.rand(200),
        "option_1": "白#{Random.rand(200)}",
        "option_2": "萝卜",
        "option_3": "XXL",
        "price": Random.rand(200),
        "stock": 9,
        "volume": 0,
        "weight": 4
      }
    }
    code, body, header = YhsdApi::ProductVariant.update(@token, @product_id, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a product variant must be success" do
    code, body, header = YhsdApi::ProductVariant.delete(@token, @product_id, 243)
    expect([200, 422]).to include(code)
  end

end