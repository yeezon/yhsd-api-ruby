module YhsdApi

  class Helper

    class << self

      ###
      #私有APP 通过 app key 和 app secret 生成标准的 0auth2 头部内容
      ###
      def authorization(key, secret)
        content = "#{key}:#{secret}"
        # 使用遵循 RFC 4648 的 Base64 编码函数
        encode = Base64.urlsafe_encode64(content)
        "Basic #{encode}"
      end

      ###
      #通过app secret和友好速搭回传的参数，验证当前请求是否来自于友好速搭
      ###
      def hmac_verify(secret, params = {})
        raise 'secret can not be empty' if secret.to_s.empty?
        if params.has_key?(:hmac)
          hmac = params[:hmac].to_s
        elsif params.has_key?("hmac")
          hmac = params["hmac"].to_s
        else
          return false
        end
        return false if hmac.empty?
        p = params.delete_if{|key, value| key.to_s == "hmac"}
        str = p.keys.sort.map do |k|
          "#{k.to_s}=#{params[k].to_s}"
        end.join('&')
        digest = OpenSSL::Digest.new('sha256')
        hmac == OpenSSL::HMAC.hexdigest(digest, secret, str)
      end

      ###
      #第三方App接入参数生成函数
      ###
      def thirdapp_aes_encrypt(secret, data = {})
        raise 'secret can not be empty' if secret.to_s.empty?
        cipher = OpenSSL::Cipher::Cipher.new("aes-128-cbc")
        cipher.encrypt
        cipher.key = secret[0, 16]
        cipher.iv = secret[16, 16]
        ciphertext = cipher.update(data) + cipher.final
        Base64.urlsafe_encode64(ciphertext)
      end

      ###
      #友好速搭webhook通知验证
      ###
      def webhook_verify(token, data, hmac)
        digest  = OpenSSL::Digest.new('sha256')
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, token, data)).strip
        calculated_hmac == hmac
      end

      ###
      #友好速搭开放支付回调验证
      ###
      alias_method :openpayment_verify, :webhook_verify

    end

  end

end
