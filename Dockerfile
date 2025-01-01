FROM ruby:3.1.4

ENV APP_ROOT /myapp
ENV LANG C.UTF-8
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install

ADD . $APP_ROOT
