require 'spec_helper'

describe YhsdApi::OpenPayment do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @id = 15
  end

  it "get all open payment must be success" do
    code, body, header = YhsdApi::OpenPayment.all(@token)
    expect(code).to eq(200)
  end

  it "get all open payment count must be success" do
    code, body, header = YhsdApi::OpenPayment.count(@token)
    expect(code).to eq(200)
  end

  it "get single open payment info must be success" do
    code, body, header = YhsdApi::OpenPayment.find(@token, @id)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

end