### Testing application recovery after PostgreSQL failover

Start Postgres primary and replica.
```
docker-compose up -d --build replica
```

Connect the application to the `cluster` host which will resolve to either the primary or the read replica.
```
docker-compose run client psql --host cluster --user postgres --tuples-only --command 'select pg_is_in_recovery()'
```

Trigger failover.
```
docker-compose exec replica touch /tmp/failover
```

Now `cluster` will provide a normal connection, whichever server it resolves to.
