require 'cgi'
require 'uri'

module Utility::URL
  def parse_query(url)
    if url =~ URI::regexp
      CGI.parse URI.parse(url).query
    else
      CGI.parse url
    end
  end
end
