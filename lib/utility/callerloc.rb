require 'uri'
require 'json'
require 'net/http'

module Utility::Callerloc
  API_URL        = 'https://www.iteblog.com/api/mobile.php'
  MUNICIPALITIES = %w(北京 上海 天津 重庆)

  def mobile_caller_location(number)
    uri = URI API_URL
    params = {:mobile => number}
    uri.query = URI.encode_www_form(params)

    res  = Net::HTTP.get_response(uri)
    data = JSON.load res.body
    if data['id'] #successed
      output = data['province'] unless MUNICIPALITIES.include?(data['province'])
      output.to_s + data['city'] + " " + data['service_provider']
    else
      data['message']
    end
  end

  alias mobile_location mobile_caller_location

end
