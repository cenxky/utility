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
Utility.base64encode "ruby"          #=> cnVieQ==
Utility.base64encode "utility"       #=> dXRpbGl0eQ==
Utility.base64encode "中文"           #=> 5Lit5paH

# base64 decode
Utility.base64decode "cnVieQ=="      #=> ruby
Utility.base64decode "dXRpbGl0eQ=="  #=> utility
Utility.base64decode "5Lit5paH"      #=> 中文
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

#### hmc ####
```ruby
Utility.hmac "sha1", "key", "the data"    #=> "ac5b94c09a6033e3aca1a02116ebf48722b155e0"
Utility.hmac "sha256", "key", "the data"  #=> "00644ab9e7ce1b772c5fcd9b460b1a4fa78de4a55c162590ac506f2f76d62a40"
```

#### params parse ####
```ruby
# full url
Utility.parse_query "http://example.com/?param1=value1&param2=value2&param3=value3"
#=> {"param1"=>["value1"], "param2"=>["value2"], "param3"=>["value3"]}

# only query params
Utility.parse_query "param1=value1&param2=value2&param3=value3"
#=> {"param1"=>["value1"], "param2"=>["value2"], "param3"=>["value3"]}
```
### computer info ###
```ruby
# get hostname
Utility.get_hostname #=> "Charles"

# get ip address
Utility.get_ip #=> "192.168.12.26"

#get mac address
Utility.get_mac #=> "c8:60:00:10:ec:ee"

#get os
Utility.get_os #=> "linux"

#get os arch
Utility.get_arch #=> 64
```

### License ###
Released under the [MIT](http://opensource.org/licenses/MIT) license. See LICENSE file for details.
