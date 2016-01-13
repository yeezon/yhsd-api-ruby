require 'spec_helper'

describe YhsdApi::CustomerAddress do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @customer_id = 16902
    @id = 320
  end

  it "get all customer address must be success" do
    params = {
      :fields => 'id,completed_address,mobile'
    }
    code, body, header = YhsdApi::CustomerAddress.all(@token, @customer_id, params)
    expect([200, 422]).to include(code)
  end

  it "get all customer address count must be success" do
    code, body, header = YhsdApi::CustomerAddress.count(@token, @customer_id)
    expect([200, 422]).to include(code)
  end

  it "get single customer address info must be success" do
    params = {
      :fields => 'id,completed_address,mobile'
    }
    code, body, header = YhsdApi::CustomerAddress.find(@token, @customer_id, @id, params)
    expect([200, 422]).to include(code)
  end

  it "create a customer must be success" do
    params =  {
      "address": {
        "name": "wwww",
        "detail": "wwww",
        "district_code": "110108",
        "mobile": "13265689612"
      }
    }
    code, body, header = YhsdApi::CustomerAddress.create(@token, @customer_id, params)
    expect([200, 422]).to include(code)
  end

  it "update a customer must be success" do
    params =  {
      "address": {
        "name": "wwww",
        "detail": "wwww",
        "district_code": "110108",
        "mobile": "1326568961#{Random.rand(9)}"
      }
    }
    code, body, header = YhsdApi::CustomerAddress.update(@token, @customer_id, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a customer must be success" do
    code, body, header = YhsdApi::CustomerAddress.delete(@token, @customer_id, 321)
    expect([200, 422]).to include(code)
  end

end