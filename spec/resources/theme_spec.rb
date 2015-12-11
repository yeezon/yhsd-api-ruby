require 'spec_helper'

describe YhsdApi::Theme do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/'
      config.call_limit_protect = true
    end
    @id = 12763
  end

  it "get all theme info will success" do
    code, body, header = YhsdApi::Theme.all(@token)
    expect(code).to eq(200)
  end

  it "get single theme info will success" do
    code, body, header = YhsdApi::Theme.find(@token, @id)
    expect(code).to eq(200)
  end

  it "update a theme info will success" do
    params = {
      "theme": {
        "name": "修改主题名#{Random.rand(100)}"
      }
    }
    code, body, header = YhsdApi::Theme.update(@token, @id, params)
    expect(code).to eq(200)
  end

  it "delete a theme will success" do
    code, body, header = YhsdApi::Theme.delete(@token, 1200)
    expect(code).to eq(422)
  end

end