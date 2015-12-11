require 'spec_helper'

describe YhsdApi::Helper do

  before(:each) do
    
  end

  it "authorization must be success" do
    key = 'a94a110d86d2452eb3e2af4cfb8a3828'
    secret = 'a84a110d86d2452eb3e2af4cfb8a3828'
    result = "Basic YTk0YTExMGQ4NmQyNDUyZWIzZTJhZjRjZmI4YTM4Mjg6YTg0YTExMGQ4NmQyNDUyZWIzZTJhZjRjZmI4YTM4Mjg="
    expect(YhsdApi::Helper::authorization(key, secret)).to eq(result)
  end

  it "hmac_verify must be success" do
    params = {  
      "shop_key": "a94a110d86d2452eb3e2af4cfb8a3828",  
      "code": "a84a110d86d2452eb3e2af4cfb8a3828",  
      "account_id": "1",
      "time_stamp": "2013-08-27T13:58:35Z",    
      "hmac": "a2a3e2dcd8a82fd9070707d4d921ac4cdc842935bf57bc38c488300ef3960726"
    }
    secret = "hush"
    expect(YhsdApi::Helper::hmac_verify(secret, params)).to eq(true)
  end

  it "webhook_verify must be success" do
    data ="{\"created_at\":\"2014-08-28T17:28:13.301+08:00\",\"domain\":\"www.example.com\",\"enable_email_regist\":true,\"enable_mobile_regist\":true,\"enable_username_regist\":true,\"name\":\"TEST\",\"page_description\":\"\",\"page_title\":\"\",\"updated_at\":\"2015-07-27T13:58:14.607+08:00\",\"url\":\"http://w...content-available-to-author-only...e.com\",\"webhook_token\":\"906155047ff74a14a1ca6b1fa74d3390\"}"
    webhook_token = "906155047ff74a14a1ca6b1fa74d3390"
    hmac = "0pGPxJlI/GFfnUm9SX2mauyQ7q57JqyJNXDid+0iouY="
    expect(YhsdApi::Helper::webhook_verify(webhook_token, data, hmac)).to eq(true)
  end

  it "openpayment_verify must be success" do
    data ="{\"created_at\":\"2014-08-28T17:28:13.301+08:00\",\"domain\":\"www.example.com\",\"enable_email_regist\":true,\"enable_mobile_regist\":true,\"enable_username_regist\":true,\"name\":\"TEST\",\"page_description\":\"\",\"page_title\":\"\",\"updated_at\":\"2015-07-27T13:58:14.607+08:00\",\"url\":\"http://w...content-available-to-author-only...e.com\",\"webhook_token\":\"906155047ff74a14a1ca6b1fa74d3390\"}"
    webhook_token = "906155047ff74a14a1ca6b1fa74d3390"
    hmac = "0pGPxJlI/GFfnUm9SX2mauyQ7q57JqyJNXDid+0iouY="
    expect(YhsdApi::Helper::openpayment_verify(webhook_token, data, hmac)).to eq(true)
  end

  it "thirdapp_encrypt must be success" do
    customer_data = {
      "uid" => "test@youhaosuda.com",
      "type" => "email",
      "name" => "test"
    }
    secret = '3B975F95D7734B4094239E8CB46C4B7C'
    expect(YhsdApi::Helper::thirdapp_encrypt(secret, customer_data.to_json)).to be_kind_of(String)
  end

end
