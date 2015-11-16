require 'spec_helper'

describe YhsdApi::Customer do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
      config.call_limit_protect = true
    end
    @id = 240
  end

  it "get all customer must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Customer.all(@token, params)
    expect(code).to eq(200)
  end

  it "get all customer count must be success" do
    code, body, header = YhsdApi::Customer.count(@token)
    expect(code).to eq(200)
  end

  it "get single customer info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Customer.find(@token, @id, params)
    expect(code).to eq(200)
  end

  it "create a customer must be success" do
    params = {
      "customer": {
        "reg_type":"email",
        "reg_identity": "for#{Random.rand(10000)}@example.com",
        "password":"123456",
        "notify_email":"for@example.com",
        "notify_phone":"13632269380"
      }
    }
    code, body, header = YhsdApi::Customer.create(@token, params)
    expect(code).to eq(200)
  end

  it "update a customer must be success" do
    params = {
      "customer": {
        "reg_type":"email",
        "reg_identity": "for#{Random.rand(10000)}@example.com",
        "password":"123456",
        "notify_email":"for@example.com",
        "notify_phone":"13632269380"
      }
    }
    code, body, header = YhsdApi::Customer.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a customer must be success" do
    code, body, header = YhsdApi::Customer.delete(@token, 243)
    expect(code).to eq(422)
  end

end