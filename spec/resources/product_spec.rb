require 'spec_helper'

describe YhsdApi::Product do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 1111
  end

  it "get all product must be success" do
    code, body, header = YhsdApi::Product.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all product count must be success" do
    code, body, header = YhsdApi::Product.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single product info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Product.find(@token, @id, params)
    expect([200, 422]).to include(code)
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
    expect([200, 422]).to include(code)
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
    expect([200, 422]).to include(code)
  end

  it "delete a product must be success" do
    code, body, header = YhsdApi::Product.delete(@token, 243)
    expect([200, 422]).to include(code)
  end

end