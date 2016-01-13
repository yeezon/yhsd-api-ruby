require 'spec_helper'

describe YhsdApi::Province do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @country_id = 1
    @id = 2
  end

  it "get all province must be success" do
    code, body, header = YhsdApi::Province.all(@token, @country_id)
    expect([200, 422]).to include(code)
  end

  it "get all province count must be success" do
    code, body, header = YhsdApi::Province.count(@token, @country_id)
    expect([200, 422]).to include(code)
  end

  it "get single province info" do
    code, body, header = YhsdApi::Province.find(@token, @country_id, @id)
    expect([200, 422]).to include(code)
  end

end