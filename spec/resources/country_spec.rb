require 'spec_helper'

describe YhsdApi::Country do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 1
  end

  it "get all country must be success" do
    code, body, header = YhsdApi::Country.all(@token)
    expect(code).to eq(200)
  end

  it "get all country count must be success" do
    code, body, header = YhsdApi::Country.count(@token)
    expect(code).to eq(200)
  end

  it "get single country info" do
    code, body, header = YhsdApi::Country.find(@token, @id)
    expect(code).to eq(200)
  end

end