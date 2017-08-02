require "openssl"

module Utility::HMAC

  def hmac(sha, key, data)
    OpenSSL::HMAC.hexdigest sha, key, data
  end

end
