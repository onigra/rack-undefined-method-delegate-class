# Debug Rack::Session::Cookie:Class

This is test repository for https://github.com/rack/rack/pull/1610

`Rack::Session::Cookie` requires `require 'delegate'`

```
/.../rack-2.2.2/lib/rack/session/cookie.rb:155:in `<class:Cookie>': undefined method `DelegateClass' for Rack::Session::Cookie:Class (NoMethodError)
```

# Setup

```sh
$ git clone
$ bundle
$ rackup
```

# Before

```ruby
# require "delegate"
require "rack/session/cookie"

run ->(env) { [200, { 'Content-Type' => 'text/plain' }, ['ok']] }
```

```sh
$ rackup

Traceback (most recent call last):
        20: from /Users/onigra/.asdf/installs/ruby/2.7.0/bin/rackup:23:in `<main>'
        19: from /Users/onigra/.asdf/installs/ruby/2.7.0/bin/rackup:23:in `load'
        18: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/bin/rackup:5:in `<top (required)>'
        17: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:168:in `start'
        16: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:311:in `start'
        15: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:379:in `handle_profiling'
        14: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:312:in `block in start'
        13: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:422:in `wrapped_app'
        12: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:249:in `app'
        11: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/server.rb:349:in `build_app_and_options_from_config'
        10: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/builder.rb:66:in `parse_file'
         9: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/builder.rb:105:in `load_file'
         8: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/builder.rb:116:in `new_from_string'
         7: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/builder.rb:116:in `eval'
         6: from /Users/onigra/src/github.com/onigra/rack-undefined-method-delegate-class/config.ru:2:in `block in <main>'
         5: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:72:in `require'
         4: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:72:in `require'
         3: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/session/cookie.rb:9:in `<top (required)>'
         2: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/session/cookie.rb:11:in `<module:Rack>'
         1: from /Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/session/cookie.rb:50:in `<module:Session>'
/Users/onigra/.asdf/installs/ruby/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.2.2/lib/rack/session/cookie.rb:155:in `<class:Cookie>': undefined method `DelegateClass' for Rack::Session::Cookie:Class (NoMethodError)
```

# After

```ruby
require "delegate"
require "rack/session/cookie"

run ->(env) { [200, { 'Content-Type' => 'text/plain' }, ['ok']] }
```

```sh
$ rackup

[2020-02-24 14:13:29] INFO  WEBrick 1.6.0
[2020-02-24 14:13:29] INFO  ruby 2.7.0 (2019-12-25) [x86_64-darwin18]
[2020-02-24 14:13:29] INFO  WEBrick::HTTPServer#start: pid=5735 port=9292
```