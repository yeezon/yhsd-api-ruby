require 'spec_helper'

describe YhsdApp::Configuration do

  before(:each) do
    
  end

  it "configure default token_url" do
    expect(YhsdApp.configuration.token_url).to eq('https://apps.youhaosuda.com/oauth2/token/')
  end

  it "configure default api_url" do
    expect(YhsdApp.configuration.api_url).to eq('https://api.youhaosuda.com/v1/')
  end

  it "configure default auth_url" do
    expect(YhsdApp.configuration.auth_url).to eq('https://apps.youhaosuda.com/oauth2/authorize/')
  end

end