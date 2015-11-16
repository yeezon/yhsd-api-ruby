# Yhsd-api-ruby Changes

0.0.2
-----------

- Add yhsd api resources
  you can use like:
```ruby
  #get the shop customers limit 50 and page 2 find id,name fields
  params = {:fields => "id,name", :page => 2, :limit => 50}
  YhsdApi::Customer.all(token, params)

  #create a customer for your shop
  params = {
    "customer": {
      "reg_type":"email",
      "reg_identity": "for@example.com",
      "password":"123456",
      "notify_email":"for@example.com",
      "notify_phone":"13632269380"
    }
  }
  YhsdApi::Customer.create(token, params)

  #update the 1120 id customer
  params = {
    "customer": {   
      "notify_email":"new@example.com",
      "notify_phone":"13632269381"
    }
  }
  YhsdApi::Customer.update(token, 1120, params)
```
- Add call limit configure
  you can open call limit configure by use
```ruby
  YhsdApi.configure do |config|
    config.call_limit_protect = true
  end
```
  this call limit is basic on shop token, so i advice open it in private app and close is public app , public app manage mutil shops, so may be some shop request api over call limit , other shop
  will be affect

0.0.1
-----------


- Basic support yhsd api
- About how to use you can see [README.md](https://github.com/yeezon/yhsd-api-ruby/blob/master/README.md)