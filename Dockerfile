FROM ruby:2.5
WORKDIR /srv/impamp
ADD impamp/Gemfile* /srv/impamp/
RUN bundle install
ADD impamp/. /srv/impamp/
RUN bundle exec middleman build --verbose
ADD healthcheck.rb .
CMD ["thin", "start"]
HEALTHCHECK --interval=1m CMD ruby healthcheck.rb
