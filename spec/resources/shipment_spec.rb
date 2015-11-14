require 'spec_helper'

describe YhsdApi::Shipment do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 809
  end

  it "get all shipment must be success" do
    code, body, header = YhsdApi::Shipment.all(@token)
    expect(code).to eq(200)
  end

  it "get all shipment count must be success" do
    code, body, header = YhsdApi::Shipment.count(@token)
    expect(code).to eq(200)
  end

  it "get single shipment must be success" do
    code, body, header = YhsdApi::Shipment.find(@token, @id)
    expect(code).to eq(200)
  end

  it "update shipment info must be success" do
    params =  {
      "shipment": {
        "shipment_supplier_id": 4
      }
    }
    code, body, header = YhsdApi::Shipment.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "send shipment must be success" do
    code, body, header = YhsdApi::Shipment.send(@token, @id)
    expect(code).to eq(200)
  end

end