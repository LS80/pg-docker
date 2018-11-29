FROM ruby:2.4-alpine

RUN apk --no-cache add \
 build-base \
 postgresql-client \
 postgresql-dev \
 ruby-bundler

WORKDIR /root

COPY Gemfile* ./

RUN bundle install --deployment

COPY docker-entrypoint.sh /usr/local/bin

COPY . .

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["ruby", "application.rb"]
