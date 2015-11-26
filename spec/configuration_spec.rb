require 'spec_helper'

describe YhsdApi::Configuration do

  before(:each) do
    
  end

  it "configure default token_url" do
    expect(YhsdApi.configuration.token_url).to eq('https://apps.youhaosuda.com/oauth2/token/')
  end

  it "configure default api_url" do
    expect(YhsdApi.configuration.api_url).to eq('https://api.youhaosuda.com')
  end

  it "configure default auth_url" do
    expect(YhsdApi.configuration.auth_url).to eq('https://apps.youhaosuda.com/oauth2/authorize/')
  end

end