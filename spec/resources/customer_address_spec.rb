require 'spec_helper'

describe YhsdApi::CustomerAddress do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @customer_id = 240
    @id = 320
  end

  it "get all customer address must be success" do
    params = {
      :fields => 'id,completed_address,mobile'
    }
    code, body, header = YhsdApi::CustomerAddress.all(@token, @customer_id, params)
    expect(code).to eq(200)
  end

  it "get all customer address count must be success" do
    code, body, header = YhsdApi::CustomerAddress.count(@token, @customer_id)
    expect(code).to eq(200)
  end

  it "get single customer address info must be success" do
    params = {
      :fields => 'id,completed_address,mobile'
    }
    code, body, header = YhsdApi::CustomerAddress.find(@token, @customer_id, @id, params)
    expect(code).to eq(200)
  end

  it "ccreate a customer must be success" do
    params =  {
      "address": {
        "name": "wwww",
        "detail": "wwww",
        "district_code": "110108",
        "mobile": "13265689612"
      }
    }
    code, body, header = YhsdApi::CustomerAddress.create(@token, @customer_id, params)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

  it "delete a customer must be success" do
    code, body, header = YhsdApi::CustomerAddress.delete(@token, @customer_id, 321)
    expect(code).to eq(422)
  end

end