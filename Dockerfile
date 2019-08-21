FROM ruby:2.3-slim-stretch

ENV HOME /root

WORKDIR /app

ADD Gemfile /app/
#ADD Gemfile Gemfile.lock /app/

RUN \
  gem install bundler && \
  bundle install --jobs 20 --retry 5

ADD . /app/
