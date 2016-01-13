require 'spec_helper'

describe YhsdApi::Shop do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end

  end

  it "get shop info will success" do
    code, body, header = YhsdApi::Shop.info(@token)
    expect([200, 422]).to include(code)
  end

end