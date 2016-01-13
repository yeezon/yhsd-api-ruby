require 'spec_helper'

describe YhsdApi::Account do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 10523
  end

  it "get all account must be success" do
    code, body, header = YhsdApi::Account.all(@token)
    expect(code).to eq(200)
  end

  it "get all account count must be success" do
    code, body, header = YhsdApi::Account.count(@token)
    expect(code).to eq(200)
  end

  it "get single account info must be success" do
    params = {
      "fields" => 'id,name'
    }
    code, body, header = YhsdApi::Account.find(@token, @id, params)
    expect([200, 422]).to include(code)
  end

end