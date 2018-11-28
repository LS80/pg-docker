FROM postgres:9.6-alpine

COPY docker-entrypoint.sh /usr/local/bin

USER postgres

CMD ["postgres", "-c", "hot_standby=on"]
