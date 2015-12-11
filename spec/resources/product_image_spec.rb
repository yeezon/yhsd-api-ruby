require 'spec_helper'

describe YhsdApi::ProductVariant do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @product_id = 1111
    @id = 1028
  end

  it "get all product image must be success" do
    code, body, header = YhsdApi::ProductImage.all(@token, @product_id)
    expect(code).to eq(200)
  end

  it "get all product image count must be success" do
    code, body, header = YhsdApi::ProductImage.count(@token, @product_id)
    expect(code).to eq(200)
  end

  it "get single product image info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::ProductImage.find(@token, @product_id, @id, params)
    expect(code).to eq(200)
  end

  it "create a product image must be success" do
    params = {
      "image": {
        "file_name": "商品图片-10098.jpg",
        "attachment": "data:image/gif;base64,R0lGODlhAQABAID/AP///wAAACwAAAAAAQABAAACAkQBADs="
      }
    }
    code, body, header = YhsdApi::ProductImage.create(@token, @product_id, params)
    expect(code).to eq(200)
  end

  it "update a product image must be success" do
    params = {
      "image": {
        "alt": "自定义描述",
        "file_name": "商品图片-98.jpg"
      }
    }
    code, body, header = YhsdApi::ProductImage.update(@token, @product_id, @id, params)
    expect(code).to eq(200)
  end

  it "delete a product image must be success" do
    code, body, header = YhsdApi::ProductImage.delete(@token, @product_id, 243)
    expect(code).to eq(422)
  end

end