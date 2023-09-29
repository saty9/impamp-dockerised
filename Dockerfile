FROM --platform=x86_64 ruby:2.5
WORKDIR /srv/impamp
ADD impamp/Gemfile* /srv/impamp/
RUN bundle install
ADD impamp/. /srv/impamp/
RUN bundle exec middleman build --verbose
ADD impamp_server.json /srv/impamp/.
RUN mkdir /srv/impamp/audio
ADD healthcheck.rb .
CMD ["thin", "start"]
