#!/bin/bash

eval "$(rbenv init -)"

if [ $# -eq 0 ]; then
  ruby -v
  ruby /tests/firefox_headless_test.rb
else
  /bin/bash -c "$@"
fi
