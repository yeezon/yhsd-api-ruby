require 'spec_helper'

describe YhsdApi::Theme do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 14130
  end

  it "get all theme info will success" do
    code, body, header = YhsdApi::Theme.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get single theme info will success" do
    code, body, header = YhsdApi::Theme.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "update a theme info will success" do
    params = {
      "theme": {
        "name": "修改主题名#{Random.rand(100)}"
      }
    }
    code, body, header = YhsdApi::Theme.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a theme will success" do
    code, body, header = YhsdApi::Theme.delete(@token, 1200)
    expect([200, 422]).to include(code)
  end

end