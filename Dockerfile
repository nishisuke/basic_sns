FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn

RUN mkdir /home/rails
WORKDIR /home/rails

ADD Gemfile /home/rails/Gemfile
ADD Gemfile.lock /home/rails/Gemfile.lock
RUN bundle install


ADD . /home/rails

RUN rm yarn.lock
RUN bundle exec yarn install
