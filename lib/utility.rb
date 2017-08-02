Dir[File.dirname(__FILE__) + '/utility/*.rb'].each {|file| require file }

module Utility
  extend Base64
  extend Digest
  extend HMAC
  extend URL
  extend Computer
end
