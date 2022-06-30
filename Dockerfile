FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y build-essential

# # for postgres
# RUN apt-get install -y libpq-dev

# # for nokogiri
# RUN apt-get install -y libxml2-dev libxslt1-dev

# # for a JS runtime
# RUN apt-get install -y nodejs

# ENV APP_HOME /myapp
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# ADD Gemfile* $APP_HOME/

# ADD . $APP_HOME

RUN apt-get update -qq && apt-get install -y build-essential
# for mysql
RUN apt-get install -y default-libmysqlclient-dev

RUN apt-get install -y libxslt-dev liblzma-dev patch git-core zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

RUN gem install bundler
RUN gem install nokogiri --platform=ruby

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
# RUN gem uninstall nokogiri -I 
# RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

ADD . $APP_HOME