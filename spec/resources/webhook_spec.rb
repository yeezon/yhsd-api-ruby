require 'spec_helper'

describe YhsdApi::Webhook do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 31
  end

  it "get all webhook must be success" do
    code, body, header = YhsdApi::Webhook.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all webhook count must be success" do
    code, body, header = YhsdApi::Webhook.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single webhook info must be success" do
    code, body, header = YhsdApi::Webhook.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "create a webhook must be success" do
    params =  {
      "webhook": {
        "address": "http://www.example.com/create_product",
         "topic": "products/create"
      }
    }
    code, body, header = YhsdApi::Webhook.create(@token, params)
    expect([200, 422]).to include(code)
  end

  it "update a webhook must be success" do
    params =  {
      "webhook": {
        "address": "http://www.example.com/create_product_1"
      }
    }
    code, body, header = YhsdApi::Webhook.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a webhook must be success" do
    code, body, header = YhsdApi::Webhook.delete(@token, 21)
    expect([200, 422]).to include(code)
  end

end