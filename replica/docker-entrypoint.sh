#!/usr/bin/env bash

rm -Rf ${PGDATA}

until pg_isready --host=primary --user=postgres; do
  sleep 1s
done

until pg_basebackup --host=primary --user=postgres --xlog-method=stream \
                    --write-recovery-conf --pgdata ${PGDATA} --verbose --progress; do
  sleep 1s
done

echo "trigger_file = '/tmp/failover'" >> "${PGDATA}/recovery.conf"

chmod -R 700 $PGDATA

exec "$@"
