FROM ruby:2.3-slim-stretch

RUN apt-get update && apt-get install -y \
  build-essential

ENV HOME /root

WORKDIR /app

ADD Gemfile Gemfile.lock /app/

RUN \
  gem install bundler && \
  bundle install --jobs 20 --retry 5

ADD . /app/
