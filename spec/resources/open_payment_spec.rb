require 'spec_helper'

describe YhsdApi::OpenPayment do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 12
  end

  it "get all open payment must be success" do
    code, body, header = YhsdApi::OpenPayment.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all open payment count must be success" do
    code, body, header = YhsdApi::OpenPayment.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single open payment info must be success" do
    code, body, header = YhsdApi::OpenPayment.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "create a open payment must be success" do
    params =  {
      "open_payment": {
        "trade_no": "TESTAAAAAA#{Random.rand(2000)}",
        "notify_url": "http://www.example.com/test/open_payment_notify_online",
        "amount": 0.01
      }
    }
    code, body, header = YhsdApi::OpenPayment.create(@token, params)
    expect([200, 422]).to include(code)
  end

end