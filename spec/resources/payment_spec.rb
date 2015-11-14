require 'spec_helper'

describe YhsdApi::Payment do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @order_id = 778
    @id = 698
  end

  it "get all payment must be success" do
    code, body, header = YhsdApi::Payment.all(@token, @order_id)
    expect(code).to eq(200)
  end

  it "get all payment count must be success" do
    code, body, header = YhsdApi::Payment.count(@token, @order_id)
    expect(code).to eq(200)
  end

  it "get single payment must be success" do
    code, body, header = YhsdApi::Payment.find(@token, @order_id, @id)
    expect(code).to eq(200)
  end

end