## Utility ##

A number of ruby useful utilities.


### Installation ###
    # Installing as Ruby gem
    $ gem install utility

    # Or in gemfile
    $ gem utility

### Usage ###
You will be able use utility in `rails c` or `irb`.

```ruby
require "utility"
```

#### base64 ####
```ruby
# base64 encode
Utility.base64encode "ruby"          #=> "cnVieQ=="
Utility.base64encode "utility"       #=> "dXRpbGl0eQ=="
Utility.base64encode "中文"           #=> "5Lit5paH"

# base64 decode
Utility.base64decode "cnVieQ=="      #=> "ruby"
Utility.base64decode "dXRpbGl0eQ=="  #=> "utility"
Utility.base64decode "5Lit5paH"      #=> "中文"
```

#### md5/rmd/sha ####
```ruby
Utility.md5 "ruby"     #=> "58e53d1324eef6265fdb97b08ed9aadf"
Utility.rmd160 "ruby"  #=> "29d9b710bc50866fa2399c3061cd02c0c8ffa197"
Utility.sha1 "ruby"    #=> "18e40e1401eef67e1ae69efab09afb71f87ffb81"
Utility.sha256 "ruby"  #=> "b9138194ffe9e7c8bb6d79d1ed56259553d18d9cb60b66e3ba5aa2e5b078055a"
Utility.sha384 "ruby"  #=> "635365ef93ebf2c7a4e40b0b497da727ab8c2914eb9f052e6be40476f95d3daf44786790f5f0e843fab419b43022e069"
Utility.sha512 "ruby"  #=> "423408d7723a3d80baefa804bd50b61a89667efec1713386a7b8efe28e5d13968307a908778cad210d7aa2dfe7db9a2aa86895f9fc1eeefcc99814310b207a6b"
```

#### hmac ####
```ruby
Utility.hmac "sha1", "key", "the data"    #=> "ac5b94c09a6033e3aca1a02116ebf48722b155e0"
Utility.hmac "sha256", "key", "the data"  #=> "00644ab9e7ce1b772c5fcd9b460b1a4fa78de4a55c162590ac506f2f76d62a40"
```

#### url/html ####
```ruby
# params parse
Utility.parse_query "http://example.com/?param1=value1&param2=value2&param3=value3"
#=> {"param1"=>["value1"], "param2"=>["value2"], "param3"=>["value3"]}
Utility.parse_query "param1=value1&param2=value2&param3=value3"
#=> {"param1"=>["value1"], "param2"=>["value2"], "param3"=>["value3"]}

# url escape
Utility.url_escape "http://example.com/search?q=#ruby&from=深圳"
#=> "http://example.com/search?q=%23ruby&from=%E6%B7%B1%E5%9C%B3"
Utility.url_escape "http://example.com/search?q=#ruby&from=深圳", :all
#=> "http%3A%2F%2Fexample.com%2Fsearch%3Fq%3D%23ruby%26from%3D%E6%B7%B1%E5%9C%B3"
Utility.url_escape "深圳"
#=> "%E6%B7%B1%E5%9C%B3"

# url unescape
Utility.url_unescape "http://example.com/search?q=%23ruby&from=%E6%B7%B1%E5%9C%B3"
#=> "http://example.com/search?q=#ruby&from=深圳"
Utility.url_unescape "http%3A%2F%2Fexample.com%2Fsearch%3Fq%3D%23ruby%26from%3D%E6%B7%B1%E5%9C%B3"
#=> "http://example.com/search?q=#ruby&from=深圳"
Utility.url_unescape "%E6%B7%B1%E5%9C%B3"
#=> "深圳"

# html escape/unescape
Utility.html_escape "<p>some text</p>"                     #=> "&lt;p&gt;some&nbsp;text&lt;/p&gt;"
Utility.html_unescape "&lt;p&gt;some&nbsp;text&lt;/p&gt;"  #=> "<p>some text</p>"
Utility.html_unescape "&copy;2017"                         #=> "©2017"

# html text
Utility.html_text("<p>This <span>is</span> <p>plain</p> text</p>")
#=> "This is plain text"
```

#### computer info ####
```ruby
# hostname/ip/mac/os/arch
Utility.get_hostname  #=> "Charles"
Utility.get_ip        #=> "192.168.12.26"
Utility.get_mac       #=> "c8:60:00:10:ec:ee"
Utility.get_os        #=> "linux"
Utility.get_arch      #=> 64
```

#### try ####
```ruby
# use 'try' as same as in rails
self.try :class                        #=> Object
self.try(:conf).try :ap_name           #=> "irb"
Utility.try{ Date.current.year.size }  #=> nil
#=> nil
```

### License ###
Released under the [MIT](http://opensource.org/licenses/MIT) license. See LICENSE file for details.
