require 'spec_helper'

describe YhsdApi::Product do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 1111
  end

  it "get all product must be success" do
    code, body, header = YhsdApi::Product.all(@token)
    puts body
    expect(code).to eq(200)
  end

  it "get all product count must be success" do
    code, body, header = YhsdApi::Product.count(@token)
    expect(code).to eq(200)
  end

  it "get single product info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Product.find(@token, @id, params)
    expect(code).to eq(200)
  end

  it "create a product must be success" do
    params =   {
      "product": {
        "name": "API商品样例",
        "page_title": "API商品样例",
        "page_description": "API商品样例",
        "body_html": "<p>API商品样例</p>",
        "vendor": {
          "name": "商品品牌样例"
        },
        "types": [
          {
            "name": "商品分类1"
          },
          {
            "name": "商品分类2"
          }
        ],
        "options": [
          {
            "name": "颜色"
          },
          {
            "name": "尺寸"
          }
        ],
        "variants": [
          {
            "option_1": "白",
            "option_2": "XL",
            "option_3": nil,
            "price": 10,
            "compare_price": 0,
            "stock": 9,
            "sale": 0,
            "weight": 40,
            "volume": 0,
            "barcode": "I2008X03",
            "image_id": nil
          },
          {
            "option_1": "白",
            "option_2": "X",
            "option_3": nil,
            "price": 10,
            "compare_price": 1000,
            "stock": 9,
            "sale": 0,
            "weight": 40,
            "volume": 0,
            "barcode": "I2008X01",
            "image_id": nil
          },
          {
            "option_1": "黑",
            "option_2": "XL",
            "option_3": nil,
            "price": 10.01,
            "compare_price": 0,
            "stock": 9,
            "sale": 0,
            "weight": 40,
            "volume": 0,
            "barcode": "I2008X02",
            "image_id": nil
          }
        ]
      }
    }
    code, body, header = YhsdApi::Product.create(@token, params)
    expect(code).to eq(200)
  end

  it "update a product must be success" do
    params = {
      "product": {
        "types": [
          {
            "name": "商品分类3"
          }
        ]
      }
    }
    code, body, header = YhsdApi::Product.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a product must be success" do
    code, body, header = YhsdApi::Product.delete(@token, 243)
    expect(code).to eq(422)
  end

end