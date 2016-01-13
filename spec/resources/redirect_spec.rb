require 'spec_helper'

describe YhsdApi::Redirect do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 40
  end

  it "get all redirect must be success" do
    code, body, header = YhsdApi::Redirect.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all redirect count must be success" do
    code, body, header = YhsdApi::Redirect.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single redirect info must be success" do
    params = {
      :fields => 'id,name'
    }
    code, body, header = YhsdApi::Redirect.find(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "create a redirect must be success" do
    params = {
      "redirect": {
        "path": "/#{Random.rand(2000)}",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApi::Redirect.create(@token, params)
    expect([200, 422]).to include(code)
  end

  it "update a redirect must be success" do
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApi::Redirect.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a redirect must be success" do
    code, body, header = YhsdApi::Redirect.delete(@token, 30)
    expect([200, 422]).to include(code)
  end

end