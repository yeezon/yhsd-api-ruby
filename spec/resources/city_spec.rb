require 'spec_helper'

describe YhsdApi::City do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @country_id = 1
    @province_id = 10
    @id = 689
  end

  it "get all city must be success" do
    code, body, header = YhsdApi::City.all(@token, @country_id, @province_id)
    expect(code).to eq(200)
  end

  it "get all city count must be success" do
    code, body, header = YhsdApi::City.count(@token, @country_id, @province_id)
    expect(code).to eq(200)
  end

  it "get single city info" do
    code, body, header = YhsdApi::City.find(@token, @country_id, @province_id, @id)
    expect(code).to eq(200)
  end

end