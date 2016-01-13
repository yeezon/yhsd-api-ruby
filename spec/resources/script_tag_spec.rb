require 'spec_helper'

describe YhsdApi::ScriptTag do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 12
  end

  it "get all script_tag must be success" do
    code, body, header = YhsdApi::ScriptTag.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all script_tag count must be success" do
    code, body, header = YhsdApi::ScriptTag.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single script_tag info" do
    code, body, header = YhsdApi::ScriptTag.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "create a script_tag must be success" do
    params = {
      "script_tag": {
        "event": "onload",
        "src": "http://static.js.com/asset.js"
      }
    }
    code, body, header = YhsdApi::ScriptTag.create(@token, params)
    expect([200, 422]).to include(code)
  end

  it "update a script_tag must be success" do
    params = {
      "script_tag": {
        "src": "http://change.js.com/asset.js"
      }
    }
    code, body, header = YhsdApi::ScriptTag.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

  it "delete a script_tag must be success" do
    code, body, header = YhsdApi::ScriptTag.delete(@token, 1)
    expect([200, 422]).to include(code)
  end

end