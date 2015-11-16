require 'spec_helper'

describe YhsdApi::Shop do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
      config.call_limit_protect = true
    end

  end

  it "get shop info will success" do
    code, body, header = YhsdApi::Shop.info(@token)
    expect(code).to eq(200)
  end

end