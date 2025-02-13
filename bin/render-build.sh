#!/usr/bin/env bash
# Exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Uncomment this line if using a Free Render instance
bundle exec rails db:migrate
