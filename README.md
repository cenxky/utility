## Utility ##

The useful utilities which made in ruby ways.


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

### TODO ###
- Add md5
- Add sha1
- Add sha256
- Add random numbers/chars

### License ###
Released under the [MIT](http://opensource.org/licenses/MIT) license. See LICENSE file for details.
