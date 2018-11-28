FROM ruby:2.4-alpine

RUN apk --no-cache add postgresql-client

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]
