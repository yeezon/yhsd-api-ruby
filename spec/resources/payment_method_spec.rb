require 'spec_helper'

describe YhsdApi::PaymentMethod do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 121050
  end

  it "get all payment method must be success" do
    code, body, header = YhsdApi::PaymentMethod.all(@token)
    expect(code).to eq(200)
  end

  it "get all payment method count must be success" do
    code, body, header = YhsdApi::PaymentMethod.count(@token)
    expect(code).to eq(200)
  end

  it "get single payment method must be success" do
    code, body, header = YhsdApi::PaymentMethod.find(@token, @id)
    expect(code).to eq(200)
  end

end