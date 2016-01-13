require 'spec_helper'

describe YhsdApi::PaymentMethod do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 121050
  end

  it "get all payment method must be success" do
    code, body, header = YhsdApi::PaymentMethod.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all payment method count must be success" do
    code, body, header = YhsdApi::PaymentMethod.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single payment method must be success" do
    code, body, header = YhsdApi::PaymentMethod.find(@token, @id)
    expect([200, 422]).to include(code)
  end

end