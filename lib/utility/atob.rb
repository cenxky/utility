module Utility::Atob

  # Base64 convert in ruby way
  # Usually, we use Base64 module to handle everything of base64 with `require 'base64'`
  # But now, here is the pure ruby code to do the same thing :D
  # refer: http://www.webtoolkitonline.com/base64-converter.html

  CHARS = [*'A'..'Z', *'a'..'z', *'0'..'9', '+', '/', '=']

  # Convert a string to Base64
  # Example:
  # base64encode("ruby")    #=> cnVieQ==
  # base64encode("utility") #=> dXRpbGl0eQ==
  # base64encode("中文")     #=> 5Lit5paH
  def base64encode(input)
    output = ""
    input = utf8_base64encode input
    (0...input.size).step(3) do |i|
      chr1, chr2, chr3 = input[i..i+2].each_char.map(&:ord) + [0]*2

      enc1 = chr1 >> 2
      enc2 = ((chr1 & 3) << 4) | (chr2 >> 4)
      enc3 = ((chr2 & 15) << 2) | (chr3 >> 6)
      enc4 = chr3 & 63

      if chr2.zero?
        enc3 = enc4 = 64
      elsif chr3.zero?
        enc4 = 64
      end
      output << CHARS.values_at(enc1, enc2, enc3, enc4).join
    end

    output
  end


  # Convert Base64 to a string
  # Example:
  # base64decode("cnVieQ==")     #=> ruby
  # base64decode("dXRpbGl0eQ==") #=> utility
  # base64decode("5Lit5paH")     #=> 中文
  def base64decode(input)
    output = ""
    input = input.gsub(/[^A-Za-z0-9\+\/\=]/, "")
    (0...input.size).step(4) do |i|
      enc1, enc2, enc3, enc4 = input[i..i+3].each_char.map{|c| CHARS.index c} + [0]*3

      chr1 = (enc1 << 2) | (enc2 >> 4)
      chr2 = ((enc2 & 15) << 4) | (enc3 >> 2)
      chr3 = ((enc3 & 3) << 6) | enc4

      output << chr1.chr
      output << chr2.chr if enc3 != 64
      output << chr3.chr if enc4 != 64
    end

    utf8_base64decode output
  end

  private

  def utf8_base64encode(string)
    string = string.to_s.gsub(/\r\n/, "\n")
    utftext = ''
    string.size.times do |i|
      c = string[i].ord
      if c < 128
        utftext << c.chr('UTF-8')
      elsif c > 127 && c < 2048
        utftext << ((c >> 6) | 192).chr('UTF-8')
        utftext << ((c & 63) | 128).chr('UTF-8')
      else
        utftext << ((c >> 12) | 224).chr('UTF-8')
        utftext << (((c >> 6) & 63) | 128).chr('UTF-8')
        utftext << ((c & 63) | 128).chr('UTF-8')
      end
    end
    utftext
  end

  def utf8_base64decode(utftext)
    string = ""
    i = 0
    while i < utftext.size do
      c = utftext[i].ord
      if (c < 128)
        string << c.chr
        i += 1
      elsif ((c > 191) && (c < 224))
        c2 = utftext[i+1].ord
        string << (((c & 31) << 6) | (c2 & 63)).chr
        i += 2
      else
        c2 = utftext[i+1].ord
        c3 = utftext[i+2].ord
        string << (((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63)).chr
        i += 3
      end
    end
    string
  end

end
