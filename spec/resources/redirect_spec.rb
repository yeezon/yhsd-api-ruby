require 'spec_helper'

describe YhsdApi::Redirect do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @id = 40
  end

  it "get all redirect must be success" do
    code, body, header = YhsdApi::Redirect.all(@token)
    expect(code).to eq(200)
  end

  it "get all redirect count must be success" do
    code, body, header = YhsdApi::Redirect.count(@token)
    expect(code).to eq(200)
  end

  it "get single redirect info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Redirect.find(@token, @id, params)
    expect(code).to eq(200)
  end

  it "create a redirect must be success" do
    params = {
      "redirect": {
        "path": "/#{Random.rand(2000)}",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApi::Redirect.create(@token, params)
    expect(code).to eq(200)
  end

  it "update a redirect must be success" do
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApi::Redirect.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a redirect must be success" do
    code, body, header = YhsdApi::Redirect.delete(@token, 30)
    expect(code).to eq(422)
  end

end