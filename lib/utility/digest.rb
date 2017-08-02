require 'digest'

module Utility::Digest

  %w[md5 sha1 sha256 sha384 sha512 rmd160].each do |method_name|
    define_method method_name do |str = nil|
      Digest.const_get(method_name.upcase).hexdigest str.to_s
    end
  end

end
