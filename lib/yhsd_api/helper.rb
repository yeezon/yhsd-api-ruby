module YhsdApi

  class Helper

    class << self

      def authorization(key, secret)
        content = "#{key}:#{secret}"
        encode = Base64.encode64(content).delete("\n\r")
        "Basic #{encode}"
      end

      def hmac_verify(secret, params = {})
        raise 'secret can not be empty' if secret.to_s.empty?
        hmac = params[:hmac].to_s
        return false if hmac.empty?
        p = params.delete_if{|key, value| key.to_s == "hmac"}
        str = p.keys.sort.map do |k|
          "#{k.to_s}=#{params[k].to_s}"
        end.join('&')
        digest = OpenSSL::Digest.new('sha256')
        hmac == OpenSSL::HMAC.hexdigest(digest, secret, str)
      end

      def thirdapp_encrypt(secret, data = {})
        raise 'secret can not be empty' if secret.to_s.empty?
        cipher = OpenSSL::Cipher::Cipher.new("aes-128-cbc")
        cipher.encrypt
        cipher.key = secret[0, 16]
        cipher.iv = secret[16, 16]
        ciphertext = cipher.update(data) + cipher.final
        Base64.urlsafe_encode64(ciphertext)
      end

      def webhook_verify(token, data, hmac)
        digest  = OpenSSL::Digest.new('sha256')
        calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, token, data)).strip
        calculated_hmac == hmac
      end

      alias_method :openpayment_verify, :webhook_verify

    end

  end

end