require 'spec_helper'

describe YhsdApi::Customer do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 16902
  end

  it "get all customer must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Customer.all(@token, params)
    expect([200, 422]).to include(code)
  end

  it "get all customer count must be success" do
    code, body, header = YhsdApi::Customer.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single customer info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Customer.find(@token, @id, params)
    expect([200, 422]).to include(code)
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
    expect([200, 422]).to include(code)
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
    expect([200, 422]).to include(code)
  end

  it "delete a customer must be success" do
    code, body, header = YhsdApi::Customer.delete(@token, 243)
    expect([200, 422]).to include(code)
  end

end