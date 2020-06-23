FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install bundler -v 2.1.4
RUN mkdir /spinner
WORKDIR /spinner
COPY Gemfile /spinner/Gemfile
COPY Gemfile.lock /spinner/Gemfile.lock
RUN bundle install
COPY . /spinner

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000
EXPOSE 7419
EXPOSE 7420
EXPOSE 443