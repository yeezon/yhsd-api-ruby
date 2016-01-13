require 'spec_helper'

describe YhsdApi::District do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @country_id = 1
    @province_id = 10
    @city_id = 689
    @id = 689
  end

  it "get all district must be success" do
    code, body, header = YhsdApi::District.all(@token, @country_id, @province_id, @city_id)
    expect([200, 422]).to include(code)
  end

  it "get all district count must be success" do
    code, body, header = YhsdApi::District.count(@token, @country_id, @province_id, @city_id)
    expect([200, 422]).to include(code)
  end

  it "get single district info" do
    code, body, header = YhsdApi::District.find(@token, @country_id, @province_id, @city_id, @id)
    expect([200, 422]).to include(code)
  end

end