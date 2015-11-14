require 'spec_helper'

describe YhsdApi::ProductVariant do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @product_id = 1111
    @id = 1375
  end

  it "get all product variant must be success" do
    code, body, header = YhsdApi::ProductVariant.all(@token, @product_id)
    expect(code).to eq(200)
  end

  it "get all product count must be success" do
    code, body, header = YhsdApi::ProductVariant.count(@token, @product_id)
    expect(code).to eq(200)
  end

  it "get single product variant info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::ProductVariant.find(@token, @product_id, @id, params)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

  it "delete a product variant must be success" do
    code, body, header = YhsdApi::ProductVariant.delete(@token, @product_id, 243)
    expect(code).to eq(422)
  end

end