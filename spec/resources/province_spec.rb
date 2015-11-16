require 'spec_helper'

describe YhsdApi::Province do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
      config.call_limit_protect = true
    end
    @country_id = 1
    @id = 2
  end

  it "get all province must be success" do
    code, body, header = YhsdApi::Province.all(@token, @country_id)
    expect(code).to eq(200)
  end

  it "get all province count must be success" do
    code, body, header = YhsdApi::Province.count(@token, @country_id)
    expect(code).to eq(200)
  end

  it "get single province info" do
    code, body, header = YhsdApi::Province.find(@token, @country_id, @id)
    expect(code).to eq(200)
  end

end