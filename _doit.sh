#!/bin/zsh

echo "ahoy thar!"

# serve and draft -- local
#
#bundle exec jekyll serve --force_polling -D -w -V -H --config _config.yml,_config.dev.yml -o

# build for push
#
bundle exec jekyll build -V --config _config.yml

