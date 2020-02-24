require "rack/session/cookie"

run ->(env) { [200, { 'Content-Type' => 'text/plain' }, ['ok']] }
