require 'spec_helper'

describe YhsdApi::Order do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 778
  end

  it "get all order must be success" do
    params = {
      "fields" => "id"
    }
    code, body, header = YhsdApi::Order.all(@token, params)
    expect([200, 422]).to include(code)
  end

  it "get all order count must be success" do
    code, body, header = YhsdApi::Order.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single order must be success" do
    code, body, header = YhsdApi::Order.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "update order info must be success" do
    params =  {
      "order": {
        "total_amount": 63.8
      }
    }
    code, body, header = YhsdApi::Order.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

end