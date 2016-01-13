require 'spec_helper'

describe YhsdApi::Payment do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @order_id = 778
    @id = 698
  end

  it "get all payment must be success" do
    code, body, header = YhsdApi::Payment.all(@token, @order_id)
    expect([200, 422]).to include(code)
  end

  it "get all payment count must be success" do
    code, body, header = YhsdApi::Payment.count(@token, @order_id)
    expect([200, 422]).to include(code)
  end

  it "get single payment must be success" do
    code, body, header = YhsdApi::Payment.find(@token, @order_id, @id)
    expect([200, 422]).to include(code)
  end

end