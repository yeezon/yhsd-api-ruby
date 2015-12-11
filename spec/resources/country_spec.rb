require 'spec_helper'

describe YhsdApi::Country do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
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