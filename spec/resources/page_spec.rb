require 'spec_helper'

describe YhsdApi::Page do

  before(:each) do
    # @token = '850e7a6b285e4d81860e77a3debd79c4'
    #localtest
    @token = 'b66079ff889e463e8c583c2c3755bd2d'
    YhsdApi.configure do |config|
      config.api_url = 'http://api.public.com/v1/'
    end
    @id = 11300
  end

  it "get all page must be success" do
    code, body, header = YhsdApi::Page.all(@token)
    expect(code).to eq(200)
  end

  it "get all page count must be success" do
    code, body, header = YhsdApi::Page.count(@token)
    expect(code).to eq(200)
  end

  it "get single page info must be success" do
    code, body, header = YhsdApi::Page.find(@token, @id)
    expect(code).to eq(200)
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
    expect(code).to eq(200)
  end

  it "update a page must be success" do
    params = {
      "page": {
          "title": "联系我们#{Random.rand(2000)}"
      }
    }
    code, body, header = YhsdApi::Page.update(@token, @id, params)
    expect(code).to eq(200)
  end

end