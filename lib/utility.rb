require_relative 'utility/version'

Dir[File.expand_path('./utility/*.rb', File.dirname(__FILE__))].each {|file| require file }

module Utility
  extend Base64
  extend Digest
  extend HMAC
  extend URL
  extend Computer
end
