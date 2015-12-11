require 'spec_helper'

describe YhsdApi::Order do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @id = 778
  end

  it "get all order must be success" do
    params = {
      "fields" => "id"
    }
    code, body, header = YhsdApi::Order.all(@token, params)
    expect(code).to eq(200)
  end

  it "get all order count must be success" do
    code, body, header = YhsdApi::Order.count(@token)
    expect(code).to eq(200)
  end

  it "get single order must be success" do
    code, body, header = YhsdApi::Order.find(@token, @id)
    expect(code).to eq(200)
  end

  it "update order info must be success" do
    params =  {
      "order": {
        "total_amount": 63.8
      }
    }
    code, body, header = YhsdApi::Order.update(@token, @id, params)
    expect(code).to eq(422)
  end

end