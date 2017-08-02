Utility = Module.new

Dir[File.dirname(__FILE__) + '/utility/*.rb'].each {|file| require file }

Utility.module_eval do
  extend Base64
  extend Digest
  extend HMAC
  extend URL
  extend Computer
end
