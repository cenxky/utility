require 'uri'
require 'json'
require 'net/http'

module Utility::Callerloc
  API_URL        = 'http://sj.apidata.cn'
  MUNICIPALITIES = %w(北京 上海 天津 重庆)

  def mobile_caller_location(number)
    uri = URI API_URL
    params = {:mobile => number}
    uri.query = URI.encode_www_form(params)

    res    = Net::HTTP.get_response(uri)
    result = JSON.load res.body
    data   = result['data']
    if result['status'].to_i == 1 #successed
      output = data['province'] unless MUNICIPALITIES.include?(data['province'])
      output.to_s + data['city'] + " " + data['types']
    else
      data['message']
    end
  end

end
