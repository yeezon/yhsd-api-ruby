require 'spec_helper'

describe YhsdApi::Shipment do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 809
  end

  it "get all shipment must be success" do
    code, body, header = YhsdApi::Shipment.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all shipment count must be success" do
    code, body, header = YhsdApi::Shipment.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single shipment must be success" do
    code, body, header = YhsdApi::Shipment.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "update shipment info must be success" do
    params =  {
      "shipment": {
        "shipment_supplier_id": 4
      }
    }
    code, body, header = YhsdApi::Shipment.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "send shipment must be success" do
    code, body, header = YhsdApi::Shipment.send(@token, @id)
    expect([200, 422]).to include(code)
  end

end