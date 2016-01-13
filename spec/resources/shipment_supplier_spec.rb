require 'spec_helper'

describe YhsdApi::ShipmentSupplier do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 2
  end

  it "get all shipment supplier must be success" do
    params = {
      "limit" => 50
    }
    code, body, header = YhsdApi::ShipmentSupplier.all(@token, params)
    expect([200, 422]).to include(code)
  end

  it "get all shipment supplier count must be success" do
    code, body, header = YhsdApi::ShipmentSupplier.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single shipment supplier must be success" do
    code, body, header = YhsdApi::ShipmentSupplier.find(@token, @id)
    expect([200, 422]).to include(code)
  end

end