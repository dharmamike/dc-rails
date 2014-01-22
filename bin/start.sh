#!/bin/bash

bundle config build.pg --with-pg-config=/usr/bin/pg_config
bundle install --gemfile=/home/app/webapp/firstapp/Gemfile
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails s