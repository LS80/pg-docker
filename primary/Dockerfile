FROM postgres:9.6-alpine

COPY setup-access.sh /docker-entrypoint-initdb.d/

CMD ["postgres", "-c", "wal_level=hot_standby", "-c", "max_wal_senders=8"]
