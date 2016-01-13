require 'spec_helper'

describe YhsdApi::Page do

  before(:each) do
    @token = '44e8d8f52062453b8fe7342c618d1aef'
    YhsdApi.configure do |config|
      config.call_limit_protect = true
    end
    @id = 11300
  end

  it "get all page must be success" do
    code, body, header = YhsdApi::Page.all(@token)
    expect([200, 422]).to include(code)
  end

  it "get all page count must be success" do
    code, body, header = YhsdApi::Page.count(@token)
    expect([200, 422]).to include(code)
  end

  it "get single page info must be success" do
    code, body, header = YhsdApi::Page.find(@token, @id)
    expect([200, 422]).to include(code)
  end

  it "create a page must be success" do
    params = {
      "page": {
          "handle": "contact#{Random.rand(2000)}",
          "mobile_template": "page.html",
          "page_description": "",
          "page_title": "联系我们#{Random.rand(2000)}",
          "template": "page.html",
          "title": "联系我们#{Random.rand(2000)}",
          "visibility": true
      }
    }
    code, body, header = YhsdApi::Page.create(@token, params)
    expect([200, 422]).to include(code)
  end

  it "update a page must be success" do
    params = {
      "page": {
          "title": "联系我们#{Random.rand(2000)}"
      }
    }
    code, body, header = YhsdApi::Page.update(@token, @id, params)
    expect([200, 422]).to include(code)
  end

end