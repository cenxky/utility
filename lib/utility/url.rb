require 'cgi'
require 'uri'
require 'nokogiri'

module Utility::URL
  def parse_query(url)
    if url =~ URI::regexp
      CGI.parse URI.parse(url).query
    else
      CGI.parse url
    end
  end

  def url_escape(url, all = :no)
    if url =~ URI::regexp && all != :all
      URI.escape url
    else
      CGI::escape url
    end
  end

  def url_unescape(url)
    URI.unescape url
  end

  def html_escape(html)
    CGI::escapeHTML(html).gsub(" ", "&nbsp;")
  end

  def html_unescape(html)
    Nokogiri::HTML.parse(html).text
  end

  def html_text(html)
    Nokogiri::HTML(html).text
  end
end
