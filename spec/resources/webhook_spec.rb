require 'spec_helper'

describe YhsdApi::Webhook do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 31
  end

  it "get all webhook must be success" do
    code, body, header = YhsdApi::Webhook.all(@token)
    expect(code).to eq(200)
  end

  it "get all webhook count must be success" do
    code, body, header = YhsdApi::Webhook.count(@token)
    expect(code).to eq(200)
  end

  it "get single webhook info must be success" do
    code, body, header = YhsdApi::Webhook.find(@token, @id)
    expect(code).to eq(200)
  end

  it "create a webhook must be success" do
    params =  {
      "webhook": {
        "address": "http://www.example.com/create_product",
         "topic": "products/create"
      }
    }
    code, body, header = YhsdApi::Webhook.create(@token, params)
    expect(code).to eq(200)
  end

  it "update a webhook must be success" do
    params =  {
      "webhook": {
        "address": "http://www.example.com/create_product_1"
      }
    }
    code, body, header = YhsdApi::Webhook.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a webhook must be success" do
    code, body, header = YhsdApi::Webhook.delete(@token, 21)
    expect(code).to eq(422)
  end

end