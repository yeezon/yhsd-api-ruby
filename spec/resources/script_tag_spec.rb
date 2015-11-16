require 'spec_helper'

describe YhsdApi::ScriptTag do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
      config.call_limit_protect = true
    end
    @id = 12
  end

  it "get all script_tag must be success" do
    code, body, header = YhsdApi::ScriptTag.all(@token)
    expect(code).to eq(200)
  end

  it "get all script_tag count must be success" do
    code, body, header = YhsdApi::ScriptTag.count(@token)
    expect(code).to eq(200)
  end

  it "get single script_tag info" do
    code, body, header = YhsdApi::ScriptTag.find(@token, @id)
    expect(code).to eq(200)
  end

  it "create a script_tag must be success" do
    params = {
      "script_tag": {
        "event": "onload",
        "src": "http://static.js.com/asset.js"
      }
    }
    code, body, header = YhsdApi::ScriptTag.create(@token, params)
    expect(code).to eq(200)
  end

  it "update a script_tag must be success" do
    params = {
      "script_tag": {
        "src": "http://change.js.com/asset.js"
      }
    }
    code, body, header = YhsdApi::ScriptTag.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a script_tag must be success" do
    code, body, header = YhsdApi::ScriptTag.delete(@token, 1)
    expect(code).to eq(422)
  end

end