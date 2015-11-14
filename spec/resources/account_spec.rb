require 'spec_helper'

describe YhsdApi::Account do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 15
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
    expect(code).to eq(200)
  end

end