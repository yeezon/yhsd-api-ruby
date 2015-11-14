require 'spec_helper'

describe YhsdApi::ShipmentSupplier do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 2
  end

  it "get all shipment supplier must be success" do
    params = {
      "limit" => 50
    }
    code, body, header = YhsdApi::ShipmentSupplier.all(@token, params)
    expect(code).to eq(200)
  end

  it "get all shipment supplier count must be success" do
    code, body, header = YhsdApi::ShipmentSupplier.count(@token)
    expect(code).to eq(200)
  end

  it "get single shipment supplier must be success" do
    code, body, header = YhsdApi::ShipmentSupplier.find(@token, @id)
    expect(code).to eq(200)
  end

end