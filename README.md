# YhsdApp

友好速搭应用开发 Ruby SDK

## 安装

在应用的gem file 中添加:

```ruby
gem 'yhsd_app'
```

执行:

```ruby
    $ bundle
```

或者直接使用命令行进行安装:

```ruby
    $ gem install yhsd_app
```

## 使用方法

1，私有应用

配置私有应用的app_key, app_secret

```ruby
    YhsdApp.configure do |config|
      config.app_key = '配置你的app_key'
      config.app_secret = '配置你的app_secret'
      config.auth_url = "https://apps.youhaosuda.com/oauth2/authorize/"
      config.token_url = 'https://apps.youhaosuda.com/oauth2/token/'
      config.api_url = 'https://api.youhaosuda.com/v1/'
    end
```

获取友好速搭token

```ruby
    YhsdApp::PrivateApp.generate_token
```

调用友好速搭api接口

```ruby
    #get 接口调用
    #url 需要访问的api接口的地址
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.get(url)
    
    #put 接口调用
    #url 需要访问的api接口的地址
    #params 参数
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.put(url, params)
    
    #post 接口调用
    #url 需要访问的api接口的地址
    #params 参数
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.post(url, params)
    
    #delete 接口调用
    #url 需要访问的api接口的地址
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.delete(url)
```

例子
```ruby
    YhsdApp::PrivateApp.token = '获取到的token'
    
    #get 接口调用
    code, body, header = YhsdApp::PrivateApp.get("https://api.youhaosuda.com/v1/shop")
    
    #put 接口调用
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApp::PrivateApp.put("https://api.youhaosuda.com/v1/redirects/1", params)
    
    #post 接口调用
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApp::PrivateApp.put("https://api.youhaosuda.com/v1/redirects", params)
    
    #delete 接口调用
    code, body, header = YhsdApp::PrivateApp.delete("https://api.youhaosuda.com/v1/redirects/1", params)
```

友好速搭的token是不过期的，你也可以通过

```ruby
    YhsdApp::PrivateApp.token = '你的私有应用token'
```

来进行指定token值，这样就不需要调用generate_token来获取token值了。

2，开放应用

配置公有一用的app_key, app_secret

```ruby
    YhsdApp.configure do |config|
      config.app_key = '配置你的app_key'
      config.app_secret = '配置你的app_secret'
      config.scope = '配置你的应用scope'
      config.auth_url = "https://apps.youhaosuda.com/oauth2/authorize/"
      config.token_url = 'https://apps.youhaosuda.com/oauth2/token/'
      config.api_url = 'https://api.youhaosuda.com/v1/'
    end
```

友好速搭hmac验证，获取到参数后调用

```ruby
    #true 表示验证正确 false 表示错误
    #params 为获取到的所有参数
    YhsdApp::PublicApp.verify_hmac(params)
```

友好速搭授权回调url获取

```ruby
    #返回结果 友好速搭授权url
    #redirect_url应用的跳转地址
    #shop_key 友好速搭安装应用的店铺唯一key
    #state 自定义的参数
    YhsdApp::PublicApp.authorize_url(redirect_url, shop_key, state)
```

友好速搭店铺token获取

```ruby
    #返回结果 店铺的开放应用token
    #redirect_url 应用的跳转地址
    #code友好速搭返回获取授权码的code
    YhsdApp::PublicApp::generate_token(redirect_url, code)
```

调用友好速搭api接口

```ruby
    #get 接口调用
    #token 访问token
    #url 需要访问的api接口的地址
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.get(token, url)
    
    #put 接口调用
    #token 访问token
    #url 需要访问的api接口的地址
    #params 参数
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.put(token, url, params)
    
    #post 接口调用
    #token 访问token
    #url 需要访问的api接口的地址
    #params 参数
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.post(token, url, params)
    
    #delete 接口调用
    #token 访问token
    #url 需要访问的api接口的地址
    #返回结果
    #code :200
    #body hash 数据
    #header hash 数据
    YhsdApp::PrivateApp.delete(token, url)
```

例子
```ruby
    token = '店铺的访问token'
    
    #get 接口调用
    code, body, header = YhsdApp::PrivateApp.get(token, "https://api.youhaosuda.com/v1/shop")
    
    #put 接口调用
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApp::PrivateApp.put(token, "https://api.youhaosuda.com/v1/redirects/1", params)
    
    #post 接口调用
    params = {
      "redirect": {
        "path": "/12345",
        "target": "/blogs"
      }
    }
    code, body, header = YhsdApp::PrivateApp.put("token, https://api.youhaosuda.com/v1/redirects", params)
    
    #delete 接口调用
    code, body, header = YhsdApp::PrivateApp.delete(token, "https://api.youhaosuda.com/v1/redirects/1", params)
```

## 贡献

1. Fork it ( https://github.com/[my-github-username]/yhsd_app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
